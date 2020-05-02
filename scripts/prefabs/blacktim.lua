local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {}

-- Custom starting inventory
local start_inv =
{
    default =
    {
    },
}

local function doHappinessDamage(inst)
    local HAPPYRATE = .1
    if inst.components.health then
        inst.components.health:DoDelta(-HAPPYRATE, false, "happiness")
    end
end

local function becomeveryhappy(inst)
    if inst.happiness == "veryhappy" then
        return
    end

    inst.components.skinner:SetSkinMode("very_happy_skin", "blacktim_very_happy")
    inst.components.talker:Say(GetString(inst, "ANNOUNCE_BECOMEVERYHAPPY"))

    if inst.happinessdot ~= nil then
	inst.happinessdot:Cancel()
	inst.happinessdot = nil
    end

    inst.happinessdot = inst:DoPeriodicTask(1/3, doHappinessDamage)

    inst.happiness = "veryhappy"
end

local function becomehappy(inst)
    if inst.happiness == "happy" then
        return
    end

    inst.components.skinner:SetSkinMode("happy_skin", "blacktim_happy")
    inst.components.talker:Say(GetString(inst, "ANNOUNCE_BECOMEHAPPY"))

    if inst.happinessdot ~= nil then
	inst.happinessdot:Cancel()
	inst.happinessdot = nil
    end

    inst.happinessdot = inst:DoPeriodicTask(1,doHappinessDamage)

    inst.happiness = "happy"
end

local function becomenormal(inst)
    if inst.happiness == "normal" then
        return
    end

    inst.components.skinner:SetSkinMode("normal_skin", "blacktim")
    inst.components.talker:Say(GetString(inst, "ANNOUNCE_BACKTONORMAL"))

    if inst.happinessdot ~= nil then
	inst.happinessdot:Cancel()
	inst.happinessdot = nil
    end

    inst.happiness = "normal"
end

local function onsanitychange (inst)
    local VERYHAPPYSANITY = 120
    local HAPPYSANITY = 90

    if inst.happiness == "veryhappy" then
        if inst.components.sanity.current < HAPPYSANITY then
            becomenormal(inst)
        elseif inst.components.sanity.current < VERYHAPPYSANITY then
            becomehappy(inst)
        end
    elseif inst.happiness == "happy" then
        if inst.components.sanity.current > VERYHAPPYSANITY then
            becomeveryhappy(inst)
        elseif inst.components.sanity.current < HAPPYSANITY then
            becomenormal(inst)
        end
    else
        if inst.components.sanity.current > VERYHAPPYSANITY then
            becomeveryhappy(inst)
        elseif inst.components.sanity.current > HAPPYSANITY then
            becomehappy(inst)
        end
    end
end

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when not a ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "blacktim_speed_mod", 1)

        inst:ListenForEvent("sanitydelta", onsanitychange)

end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "blacktim_speed_mod")
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

-- When loading or spawning the character
local function onspawn(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    inst.components.sanity:DoDelta(-70) -- Start with 80 sanity

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst)
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "blacktim.tex" )
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "maxwell"

        inst.happiness = "normal"
        inst.happinessdot = nil

        inst.components.sanity.night_drain_mult = 0
        inst.components.sanity.neg_aura_mult = 0.7

	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"

	-- Stats
	inst.components.health:SetMaxHealth(75)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(150)

	-- Damage multiplier (optional)
        inst.components.combat.damagemultiplier = 0.8

	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE

	inst.OnLoad = onload
    inst.OnNewSpawn = onspawn

end

return MakePlayerCharacter("blacktim", prefabs, assets, common_postinit, master_postinit, start_inv)
