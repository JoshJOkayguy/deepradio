local team = team local string = string local player = player

util.AddNetworkString("DeepRadio:SendMessage")

do
    for job,_ in pairs(DeepRadio.Jobs) do
        local prfx = ""
        if #prfx <= 3 then
            prfx = job
        else
            prfx = string.sub(job,1,3)
        end
        DeepRadio.Prefixes[job] = string.upper(prfx)
    end
end

hook.Add("PlayerSay", "DeepRadio", function(ply,txt,tc)
    local t = ply:Team()
    local tname = team.GetName(t)
    local message
    local cmd
    local sendto = {}

    do
        local spacepos = string.find(txt, " ", 2)
        if not spacepos then return end

        cmd = string.sub(txt, 2, spacepos - 1)
        
        if not DeepRadio.Jobs[cmd] then return end
        if not DeepRadio.Jobs[cmd][tname] then return end -- Job and command validation.

        message = string.sub(txt, spacepos + 1)
    end

    for _,v in ipairs(player.GetAll()) do
        do
            local pteam = v:Team()
            local pteam_name = team.GetName(pteam)

            if DeepRadio.Jobs[cmd][pteam_name] or DeepRadio.AdminGroups[v:GetUserGroup()] then
                table.insert(sendto, v)
            end
        end
    end

    net.Start("DeepRadio:SendMessage")
        net.WriteString(cmd)
        net.WriteString(DeepRadio.Prefixes[cmd])
        net.WriteString(ply:Name())
        net.WriteString(message)
    net.Send(sendto)

    return ""
end )

MsgC("\n[Deep Radio]",DeepRadio.Success, " Serverside initialized.")
