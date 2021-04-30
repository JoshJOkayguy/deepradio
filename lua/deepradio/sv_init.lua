local team = team local string = string local player = player

util.AddNetworkString("DeepRadio:SendMessage")

do
    for job,_ in pairs(DeepRadio.Jobs) do
        local prfx = string.sub(job,1,3)
        DeepRadio.Prefixes[job] = string.upper(prfx)
    end
end

hook.Add("PlayerSay", "DeepRadio", function(ply,txt,tc)
    local t = ply:Team()
    local tname = team.GetName(t)
    local isadmin = DeepRadio.AdminGroups[ply:GetUserGroup()]

    for group,jobs in pairs(DeepRadio.Jobs) do
        if string.StartWith(txt,"/"..group) then
            goto commandused
        else
            continue
        end
        ::commandused::

        if jobs[tname] or isadmin then -- Admin check 1
            local msg = string.sub(txt, string.len(group) + 2)

            local sendTo = {}
            do
                for _,v in ipairs(player.GetAll()) do
                    local tm = v:Team()
                    local tmname = team.GetName(tm)
                    local admin = DeepRadio.AdminGroups[v:GetUserGroup()]

                    if jobs[tmname] or admin then -- Admin check to send message 2
                        table.insert(sendTo, v)
                    end
                end
            end

            timer.Simple(0, function()
                net.Start("DeepRadio:SendMessage")
                    net.WriteString(ply:Name())
                    net.WriteString(group)
                    net.WriteString(msg)
                net.Send(sendTo)
            end )
        end
    end
        
    return "" -- Should get the message to stop displaying.
end )

MsgC("\n[Deep Radio]",DeepRadio.Success, " Serverside initialized.")
