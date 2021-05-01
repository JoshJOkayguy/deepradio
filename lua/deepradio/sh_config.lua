-- The following is case sensitive (not the categories, the jobs. "security" is a category and "Citizen" is a job).
-- JOB GROUPS CAN __NOT__ BE MORE THAN ONE WORD.
DeepRadio.Jobs = {
    ["security"] = {
        ["Gun Dealer"] = true, 
        ["Security Sergeant"] = true,
    },
    ["research"] = {
        ["Medic"] = true,
        ["Hazmat Researcher"] = true,
    },
    ["chaos"] = {
        ["Hobo"] = true
    },
    ["foundation"] = {
        ["Gun Dealer"] = true,
        ["Medic"] = true,
        ["Hobo"] = true
    }
}

-- Usergroups that will have full access to all channels. DM me if you have compatibility issues with this.
-- Also, if you'd like to use a "Staff on Duty" job instead just set "superadmin" to false and insert the job into the Jobs config table above in every category, I cba to add an easy solution for that.
DeepRadio.AdminGroups = {
    ["superadmin"] = true,
}

-- You should add a new color for each job, otherwise it will all be white and look ugly as fuck.
DeepRadio.ChannelColors = {
    ["security"] = Color(46,109,190),
    ["research"] = Color(167,63,31),
    ["chaos"] = Color(48,187,48),
    ["foundation"] = Color(221,204,46)
}

MsgC("\n[Deep Radio]",DeepRadio.Success, " Config initialized.")
