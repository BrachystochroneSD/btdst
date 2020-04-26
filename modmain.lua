PrefabFiles = {
	"blacktim",
	"blacktim_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/blacktim.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/blacktim.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/blacktim.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/blacktim.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/blacktim_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/blacktim_silho.xml" ),

    Asset( "IMAGE", "bigportraits/blacktim.tex" ),
    Asset( "ATLAS", "bigportraits/blacktim.xml" ),

	Asset( "IMAGE", "images/map_icons/blacktim.tex" ),
	Asset( "ATLAS", "images/map_icons/blacktim.xml" ),

	Asset( "IMAGE", "images/avatars/avatar_blacktim.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_blacktim.xml" ),

	Asset( "IMAGE", "images/avatars/avatar_ghost_blacktim.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_blacktim.xml" ),

	Asset( "IMAGE", "images/avatars/self_inspect_blacktim.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_blacktim.xml" ),

	Asset( "IMAGE", "images/names_blacktim.tex" ),
    Asset( "ATLAS", "images/names_blacktim.xml" ),

	Asset( "IMAGE", "images/names_gold_blacktim.tex" ),
    Asset( "ATLAS", "images/names_gold_blacktim.xml" ),
}

AddMinimapAtlas("images/map_icons/blacktim.xml")

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.blacktim = "Black Tim"
STRINGS.CHARACTER_NAMES.blacktim = "BTM"
STRINGS.CHARACTER_DESCRIPTIONS.blacktim = "*His World is full of darkness\n*Sometimes he think about Happiness\n*Happiness is a warm gun"
STRINGS.CHARACTER_QUOTES.blacktim = "\"My workd is full of Darkness\""

-- Custom speech strings
STRINGS.CHARACTERS.BLACKTIM = require "speech_blacktim"

-- The character's name as appears in-game
STRINGS.NAMES.BLACKTIM = "Btm"
STRINGS.SKIN_NAMES.blacktim_none = "Btm"

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("blacktim", "MALE")
