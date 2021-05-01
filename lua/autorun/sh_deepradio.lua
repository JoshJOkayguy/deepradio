if SERVER then
    AddCSLuaFile("deepradio/sh_init.lua")    
end
include("deepradio/sh_init.lua")

assert(DeepRadio, "Deep Radio failed to initialize. This is likely just a loading error.")

local dir = "deepradio"

DeepRadio.Files = {
    "sh_config",
    "sv_init",
    "cl_init",
}

for i,fil in ipairs(DeepRadio.Files) do
    if string.StartWith(fil,"sh_") then
        if SERVER then
            AddCSLuaFile(dir.."/"..fil..".lua")
        end
        include(dir.."/"..fil..".lua")
    end

    if SERVER and string.StartWith(fil,"cl_") then
        AddCSLuaFile(dir.."/"..fil..".lua")
    elseif SERVER then
        include(dir.."/"..fil..".lua")
    end

    if CLIENT and not string.StartWith(fil,"sv_") then
        include(dir.."/"..fil..".lua")
    end
end

MsgC("\n[Deep Radio]", DeepRadio.Success, " Deep Radio successfully initalized." )
