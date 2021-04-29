net.Receive("DeepRadio:SendMessage", function()
    local sender = net.ReadString()
    local chnl = net.ReadString()
    local msg = net.ReadString()

    local capchnl = string.Explode("", chnl)

    capchnl[1] = string.upper(capchnl[1])

    capchnl = table.concat(capchnl, "")

    chat.AddText(color_white, "[",DeepRadio.ChannelColors[chnl], capchnl, color_white, "] "..sender..": "..msg)
end )

MsgC("\n[Deep Radio]",DeepRadio.Success, " Clientside initialized.")