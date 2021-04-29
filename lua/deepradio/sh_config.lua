DeepRadio = {}

-- The following is case sensitive.
DeepRadio.Jobs = {
    ["security"] = {
        ["Citizen"] = true, 
        ["Medic"] = true
    },
    ["research"] = {
        ["Gun Dealer"] = true
    },
}

-- You should add a new color for each job, otherwise it will all be white and look ugly as fuck.
DeepRadio.ChannelColors = {
    ["security"] = Color(46,109,190),
    ["research"] = Color(167,63,31)
}

-- Do not mess with the following.
DeepRadio.Failure = Color(167,48,48)
DeepRadio.Success = Color(61,184,50)
DeepRadio.Prefixes = {}
MsgC("\n[Deep Radio]",DeepRadio.Success, " Config initialized.")
