net.Receive("DeepRadio:SendMessage", function()
    local chnl = net.ReadString()
    local prfx = net.ReadString()
    local sender = net.ReadString()
    local msg = net.ReadString()

    chat.AddText(color_white, "[",DeepRadio.ChannelColors[chnl], prfx, color_white, "] "..sender..": "..msg)
end )

MsgC("\n[Deep Radio]",DeepRadio.Success, " Clientside initialized.")