local assets =
{
	Asset( "ANIM", "anim/blacktim.zip" ),
	Asset( "ANIM", "anim/blacktim_happy.zip" ),
	Asset( "ANIM", "anim/blacktim_very_happy.zip" ),
	Asset( "ANIM", "anim/ghost_blacktim_build.zip" ),
}

local skins =
{
	normal_skin = "blacktim",
	happy_skin = "blacktim_happy",
	very_happy_skin = "blacktim_very_happy",
	ghost_skin = "ghost_blacktim_build",
}

return CreatePrefabSkin("blacktim_none",
{
	base_prefab = "blacktim",
	type = "base",
	assets = assets,
	skins = skins,
	skin_tags = {"BLACKTIM", "CHARACTER", "BASE"},
	build_name_override = "blacktim",
	rarity = "Character",
})