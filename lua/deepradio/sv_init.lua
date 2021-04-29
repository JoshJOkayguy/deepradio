MsgC("\n[Deep Radio]",DeepRadio.Success, " Serverside initialized.")

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

    for group,jobs in pairs(DeepRadio.Jobs) do
        if string.StartWith(txt,"/"..group) then
            goto commandused
        else
            continue
        end
        ::commandused::

        if jobs[tname] then
            local msg = string.sub(txt, string.len(group) + 2)

            local sendTo = {}
            do
                for _,v in ipairs(player.GetAll()) do
                    local tm = v:Team()
                    local tmname = team.GetName(tm)

                    if jobs[tmname] then
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
end )