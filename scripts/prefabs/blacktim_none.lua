local assets =
{
	Asset( "ANIM", "anim/blacktim.zip" ),
	Asset( "ANIM", "anim/ghost_blacktim_build.zip" ),
}

local skins =
{
	normal_skin = "blacktim",
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