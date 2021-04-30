DeepRadio = {}

-- Don't forget your commas big guy

-- The following is case sensitive (not the categories, the jobs. "security" is a category and "Citizen" is a job).
DeepRadio.Jobs = {
    ["security"] = {
        ["Security Officer"] = true, 
        ["Security Sergeant"] = true,
    },
    ["research"] = {
        ["Junior Researcher"] = true,
        ["Hazmat Researcher"] = true,
    },
}

-- Usergroups that will have full access to all channels. DM me if you have compatibility issues with this.
DeepRadio.AdminGroups = {
    "superadmin" = true,
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
