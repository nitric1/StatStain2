--[[
  *
  * StatStain2: StatStain Rebuilt.
  *
  * This addon is compact version of StatStain (by Nymbia).
  *
  ]]

local L = StatStain2Locale
local AppName = L["StatStain2: StatStain Rebuilt"]
local Version = "0.9.0"
local AppFullName = AppName .. " " .. Version

local tooltips = {
	ItemRefTooltip,
	GameTooltip,
	ShoppingTooltip1,
	ShoppingTooltip2,
	ItemSocketingDescription,
-- EquipCompare
	ComparisonTooltip1,
	ComparisonTooltip2,
-- EQCompare
	EQCompareTooltip1,
	EQCompareTooltip2,
-- LinkWrangler
	IRR_ItemRefTooltip1,
	IRR_ItemCompTooltip1,
	IRR_ItemCompTool11,
	IRR_ItemRefTooltip2,
	IRR_ItemCompTooltip2,
	IRR_ItemCompTool12,
	IRR_ItemRefTooltip3,
	IRR_ItemCompTooltip3,
	IRR_ItemCompTool13,
	IRR_ItemRefTooltip4,
	IRR_ItemCompTooltip4,
	IRR_ItemCompTool14,
	IRR_ItemRefTooltip5,
	IRR_ItemCompTooltip5,
	IRR_ItemCompTool15,
-- MultiTips
	ItemRefTooltip2,
	ItemRefTooltip3,
	ItemRefTooltip4,
	ItemRefTooltip5,
-- Bonuses
	TooltipScan1,
	TooltipScan2,
	TooltipScan3,
	TooltipScan4,
}

local statstr = '%c%d STAT'

local transforms = {
	[ITEM_MOD_STRENGTH]										= statsColors.strength,
	-- [L[statstr]:gsub('STAT', ITEM_MOD_ATTACK_POWER_SHORT)]	= statsColors.attackPower,
	-- [L['Equip: '] .. ITEM_MOD_ATTACK_POWER]					= statsColors.attackPower,
	[L[statstr]:gsub('STAT', ITEM_MOD_BLOCK_VALUE_SHORT)]	= statsColors.blockValue,
	[statstr:gsub('STAT', ITEM_MOD_BLOCK_VALUE_SHORT)]		= statsColors.blockValue,
	-- [L['Equip: '] .. ITEM_MOD_BLOCK_VALUE]					= statsColors.blockValue,
	[L[statstr]:gsub('STAT', ITEM_MOD_PARRY_RATING_SHORT)]	= statsColors.parry,
	[statstr:gsub('STAT', ITEM_MOD_PARRY_RATING_SHORT)]		= statsColors.parry,
	-- [L['Equip: '] .. ITEM_MOD_PARRY_RATING]					= statsColors.parry,

	[ITEM_MOD_AGILITY]												= statsColors.agility,
	[L[statstr]:gsub('STAT', ITEM_MOD_RANGED_ATTACK_POWER_SHORT)]	= statsColors.rangedPower,
	[statstr:gsub('STAT', ITEM_MOD_RANGED_ATTACK_POWER_SHORT)]		= statsColors.rangedPower,
	-- [L['Equip: '] .. ITEM_MOD_RANGED_ATTACK_POWER]					= statsColors.rangedPower,
	[ARMOR_TEMPLATE]												= statsColors.armor,
	[L[statstr]:gsub('STAT', ITEM_MOD_CRIT_RATING_SHORT)]			= statsColors.critical,
	[statstr:gsub('STAT', ITEM_MOD_CRIT_RATING_SHORT)]				= statsColors.critical,
	-- [L['Equip: '] .. ITEM_MOD_CRIT_RATING]							= statsColors.critical,
	[L[statstr]:gsub('STAT', ITEM_MOD_DODGE_RATING_SHORT)]			= statsColors.dodge,
	[statstr:gsub('STAT', ITEM_MOD_DODGE_RATING_SHORT)]				= statsColors.dodge,
	-- [L['Equip: '] .. ITEM_MOD_DODGE_RATING]							= statsColors.dodge,

	[ITEM_MOD_STAMINA]		= statsColors.stamina,
	[ITEM_MOD_HEALTH]		= statsColors.health,

	[ITEM_MOD_INTELLECT]	= statsColors.intellect,
	[ITEM_MOD_MANA]			= statsColors.mana,

	[ITEM_MOD_SPIRIT]												= statsColors.spirit,
	[L[statstr]:gsub('STAT', ITEM_MOD_HEALTH_REGENERATION_SHORT)]	= statsColors.hp5,
	[statstr:gsub('STAT', ITEM_MOD_HEALTH_REGENERATION_SHORT)]		= statsColors.hp5,
	-- [L['Equip: '] .. ITEM_MOD_HEALTH_REGENERATION]						= statsColors.hp5,
	[L[statstr]:gsub('STAT', ITEM_MOD_MANA_REGENERATION_SHORT)]		= statsColors.mp5,
	[statstr:gsub('STAT', ITEM_MOD_MANA_REGENERATION_SHORT)]		= statsColors.mp5,
	-- [L['Equip: '] .. ITEM_MOD_MANA_REGENERATION]						= statsColors.mp5,

	[DAMAGE_TEMPLATE]											= statsColors.weaponDamage,
	[SPEED .. ' %.2f']											= statsColors.weaponSpeed,
	[ITEM_MOD_FERAL_ATTACK_POWER]								= statsColors.feralPower,
	[L[statstr]:gsub('STAT', ITEM_MOD_HIT_RATING_SHORT)]		= statsColors.hit,
	[statstr:gsub('STAT', ITEM_MOD_HIT_RATING_SHORT)]			= statsColors.hit,
	-- [L['Equip: '] .. ITEM_MOD_HIT_RATING]						= statsColors.hit,
	[L[statstr]:gsub('STAT', ITEM_MOD_HASTE_RATING_SHORT)]		= statsColors.haste,
	[statstr:gsub('STAT', ITEM_MOD_HASTE_RATING_SHORT)]			= statsColors.haste,
	-- [L['Equip: '] .. ITEM_MOD_HASTE_RATING]						= statsColors.haste,
	[L[statstr]:gsub('STAT', ITEM_MOD_EXPERTISE_RATING_SHORT)]	= statsColors.expertise,
	[statstr:gsub('STAT', ITEM_MOD_EXPERTISE_RATING_SHORT)]		= statsColors.expertise,
	-- [L['Equip: '] .. ITEM_MOD_EXPERTISE_RATING]					= statsColors.expertise,

	[L[statstr]:gsub('STAT', ITEM_MOD_SPELL_POWER_SHORT)]		= statsColors.spellPower,
	[statstr:gsub('STAT', ITEM_MOD_SPELL_POWER_SHORT)]			= statsColors.spellPower,
	-- [L['Equip: '] .. ITEM_MOD_SPELL_POWER]						= statsColors.spellPower,
	[L[statstr]:gsub('STAT', ITEM_MOD_SPELL_PENETRATION_SHORT)]	= statsColors.spellPenetration,
	[statstr:gsub('STAT', ITEM_MOD_SPELL_PENETRATION_SHORT)]	= statsColors.spellPenetration,
	-- [L['Equip: '] .. ITEM_MOD_SPELL_PENETRATION]				= statsColors.spellPenetration,

	[L[statstr]:gsub('STAT', ITEM_MOD_DEFENSE_SKILL_RATING_SHORT)]	= statsColors.defense,
	[statstr:gsub('STAT', ITEM_MOD_DEFENSE_SKILL_RATING_SHORT)]		= statsColors.defense,
	-- [L['Equip: '] .. ITEM_MOD_DEFENSE_SKILL_RATING]					= statsColors.defense,
	[L[statstr]:gsub('STAT', ITEM_MOD_BLOCK_RATING_SHORT)]			= statsColors.blockRating,
	[statstr:gsub('STAT', ITEM_MOD_BLOCK_RATING_SHORT)]				= statsColors.blockRating,
	-- [L['Equip: '] .. ITEM_MOD_BLOCK_RATING]							= statsColors.blockRating,

	[L[statstr]:gsub('STAT', ITEM_MOD_RESILIENCE_RATING_SHORT)]		= statsColors.resilience,
	[statstr:gsub('STAT', ITEM_MOD_RESILIENCE_RATING_SHORT)]		= statsColors.resilience,
	-- [L['Equip: '] .. ITEM_MOD_RESILIENCE_RATING]						= statsColors.resilience,
	[L[statstr]:gsub('STAT', ITEM_MOD_PVP_POWER_SHORT)]				= statsColors.pvppower,
	[statstr:gsub('STAT', ITEM_MOD_PVP_POWER_SHORT)]				= statsColors.pvppower,
	-- [L['Equip: '] .. ITEM_MOD_PVP_POWER]							= statsColors.pvppower,
	-- [L['Equip: '] .. L['Increases your pvp power by %s (Unique).']]	= statsColors.pvppower,

	[L[statstr]:gsub('STAT', ITEM_MOD_MASTERY_RATING_SHORT)]	= statsColors.mastery,
	[statstr:gsub('STAT', ITEM_MOD_MASTERY_RATING_SHORT)]		= statsColors.mastery,
	-- [L['Equip: '] .. ITEM_MOD_MASTERY_RATING]					= statsColors.mastery,

	[L['%s %s Damage']:format('%c%d', L['Arcane'])]	= statsColors.arcaneDamage, -- Wands
	[L['%s %s Damage']:format('%c%d', L['Fire'])]	= statsColors.fireDamage,
	[L['%s %s Damage']:format('%c%d', L['Frost'])]	= statsColors.frostDamage,
	[L['%s %s Damage']:format('%c%d', L['Nature'])]	= statsColors.natureDamage,
	[L['%s %s Damage']:format('%c%d', L['Shadow'])]	= statsColors.shadowDamage,

	[L['%s - %s %s Damage']:format('%d', '%d', L['Arcane'])]	= statsColors.arcaneDamage, -- Wands
	[L['%s - %s %s Damage']:format('%d', '%d', L['Fire'])]		= statsColors.fireDamage,
	[L['%s - %s %s Damage']:format('%d', '%d', L['Frost'])]		= statsColors.frostDamage,
	[L['%s - %s %s Damage']:format('%d', '%d', L['Nature'])]	= statsColors.natureDamage,
	[L['%s - %s %s Damage']:format('%d', '%d', L['Shadow'])]	= statsColors.shadowDamage,

	[L['%s %s Resistance']:format('%c%d', L['Arcane'])]	= statsColors.arcaneResist,
	[L['%s %s Resistance']:format('%c%d', L['Fire'])]	= statsColors.fireResist,
	[L['%s %s Resistance']:format('%c%d', L['Frost'])]	= statsColors.frostResist,
	[L['%s %s Resistance']:format('%c%d', L['Nature'])]	= statsColors.natureResist,
	[L['%s %s Resistance']:format('%c%d', L['Shadow'])]	= statsColors.shadowResist,
}

local gems = {
-- Red
--  BC
	['interface\\icons\\inv_misc_gem_bloodstone_01']				= statsColors.redGem,
	['interface\\icons\\inv_misc_gem_bloodstone_02']				= statsColors.redGem,
	['interface\\icons\\inv_misc_gem_ruby_01']						= statsColors.redGem,
	['interface\\icons\\inv_misc_gem_ruby_02']						= statsColors.redGem,
	['interface\\icons\\inv_misc_gem_ruby_03']						= statsColors.redGem,
	['interface\\icons\\inv_misc_gem_bloodgem_02']					= statsColors.redGem,
	['interface\\icons\\inv_jewelcrafting_livingruby_03']			= statsColors.redGem,
	['interface\\icons\\inv_jewelcrafting_crimsonspinel_02']		= statsColors.redGem,

--  WotLK
	['interface\\icons\\inv_jewelcrafting_gem_22']					= statsColors.redGem,
	['interface\\icons\\inv_jewelcrafting_gem_16']					= statsColors.redGem,

	['interface\\icons\\inv_jewelcrafting_gem_28']					= statsColors.redGem,

	['interface\\icons\\inv_jewelcrafting_dragonseye05']			= statsColors.redGem,
	['interface\\icons\\inv_jewelcrafting_gem_37']					= statsColors.redGem,

--  Cat
	['interface\\icons\\inv_misc_cutgemnormala']					= statsColors.redGem,
	['interface\\icons\\inv_misc_cutgemperfect4']					= statsColors.redGem,

	['interface\\icons\\inv_misc_cutgemsuperior6']					= statsColors.redGem,

	['interface\\icons\\inv_misc_epicgem_01']						= statsColors.redGem,

--  MoP
	['interface\\icons\\inv_misc_gem_x4_uncommon_cut_red']			= statsColors.redGem,

	['interface\\icons\\inv_misc_gem_x4_uncommon_perfectcut_red']	= statsColors.redGem,
	['interface\\icons\\inv_misc_gem_x4_rare_cut_red']				= statsColors.redGem,

--  (no epic red gem)

-- Green
--  BC
	['interface\\icons\\inv_misc_gem_deepperidot_01']				= statsColors.greenGem,
	['interface\\icons\\inv_misc_gem_deepperidot_02']				= statsColors.greenGem,
	['interface\\icons\\inv_misc_gem_deepperidot_03']				= statsColors.greenGem,
	['interface\\icons\\inv_jewelcrafting_talasite_03']				= statsColors.greenGem,
	['interface\\icons\\inv_jewelcrafting_seasprayemerald_02']		= statsColors.greenGem,

--  WotLK
	['interface\\icons\\inv_jewelcrafting_gem_19']					= statsColors.greenGem,
	['interface\\icons\\inv_jewelcrafting_gem_13']					= statsColors.greenGem,

	['interface\\icons\\inv_jewelcrafting_gem_25']					= statsColors.greenGem,

	['interface\\icons\\inv_jewelcrafting_gem_41']					= statsColors.greenGem,

--  Cat
	['interface\\icons\\inv_misc_cutgemnormal5a']					= statsColors.greenGem,
	['interface\\icons\\inv_misc_cutgemperfect5']					= statsColors.greenGem,

	['interface\\icons\\inv_misc_cutgemsuperior5']					= statsColors.greenGem,

	['interface\\icons\\inv_misc_epicgem_06']						= statsColors.greenGem,

--  MoP
	['interface\\icons\\inv_misc_gem_x4_uncommon_cut_green']		= statsColors.greenGem,

	['interface\\icons\\inv_misc_gem_x4_uncommon_perfectcut_green']	= statsColors.greenGem,
	['interface\\icons\\inv_misc_gem_x4_rare_cut_green']			= statsColors.greenGem,

--  (epic green gem same as uncommon cut)

-- Yellow
--  BC
	['interface\\icons\\inv_misc_gem_topaz_01']							= statsColors.yellowGem,
	['interface\\icons\\inv_misc_gem_topaz_02']							= statsColors.yellowGem,
	['interface\\icons\\inv_misc_gem_topaz_03']							= statsColors.yellowGem,
	['interface\\icons\\inv_misc_gem_goldendraenite_02']				= statsColors.yellowGem,
	['interface\\icons\\inv_jewelcrafting_dawnstone_03']				= statsColors.yellowGem,
	['interface\\icons\\inv_jewelcrafting_lionseye_02']					= statsColors.yellowGem,

--  WotLK
	['interface\\icons\\inv_jewelcrafting_gem_21']						= statsColors.yellowGem,
	['interface\\icons\\inv_jewelcrafting_gem_15']						= statsColors.yellowGem,

	['interface\\icons\\inv_jewelcrafting_gem_26']						= statsColors.yellowGem,

	['interface\\icons\\inv_jewelcrafting_dragonseye03']				= statsColors.yellowGem,
	['interface\\icons\\inv_jewelcrafting_gem_38']						= statsColors.yellowGem,

--  Cat
	['interface\\icons\\inv_misc_cutgemnormal6a']						= statsColors.yellowGem,

	['interface\\icons\\inv_misc_cutgemsuperior']						= statsColors.yellowGem,

	['interface\\icons\\inv_misc_epicgem_03']							= statsColors.yellowGem,

--  MoP
	['interface\\icons\\inv_misc_gem_x4_uncommon_cut_yellow']			= statsColors.yellowGem,

	['interface\\icons\\inv_misc_gem_x4_uncommon_perfectcut_yellow']	= statsColors.yellowGem,
	['interface\\icons\\inv_misc_gem_x4_rare_cut_yellow']				= statsColors.yellowGem,

--  (no epic yellow gem)

-- Orange
--  BC
	['interface\\icons\\inv_misc_gem_opal_01']				= statsColors.orangeGem,
	['interface\\icons\\inv_misc_gem_opal_02']				= statsColors.orangeGem,
	['interface\\icons\\inv_misc_gem_opal_03']				= statsColors.orangeGem,
	['interface\\icons\\inv_misc_gem_flamespessarite_02']	= statsColors.orangeGem,
	['interface\\icons\\inv_jewelcrafting_nobletopaz_03']	= statsColors.orangeGem,
	['interface\\icons\\inv_jewelcrafting_pyrestone_02']	= statsColors.orangeGem,

--  WotLK
	['interface\\icons\\inv_jewelcrafting_gem_20']			= statsColors.orangeGem,
	['interface\\icons\\inv_jewelcrafting_gem_14']			= statsColors.orangeGem,

	['interface\\icons\\inv_jewelcrafting_gem_30']			= statsColors.orangeGem,

	['interface\\icons\\inv_jewelcrafting_gem_39']			= statsColors.orangeGem,

--  Cat
	['interface\\icons\\inv_misc_cutgemnormal3a']			= statsColors.orangeGem,

	['interface\\icons\\inv_misc_cutgemsuperior4']			= statsColors.orangeGem,

	['interface\\icons\\inv_misc_epicgem_04']				= statsColors.orangeGem,

--  MoP
	['interface\\icons\\inv_misc_gem_x4_uncommon_cut_orange']		= statsColors.orangeGem,

	['interface\\icons\\inv_misc_gem_x4_uncommon_perfectcut_orange']	= statsColors.orangeGem,
	['interface\\icons\\inv_misc_gem_x4_rare_cut_orange']			= statsColors.orangeGem,

--  (epic orange gem same as uncommon cut)

-- Blue
--  BC
	['interface\\icons\\inv_misc_gem_crystal_03']				= statsColors.blueGem,
	['interface\\icons\\inv_misc_gem_azuredraenite_02']			= statsColors.blueGem,
	['interface\\icons\\inv_jewelcrafting_starofelune_03']		= statsColors.blueGem,
	['interface\\icons\\inv_jewelcrafting_empyreansapphire_02']	= statsColors.blueGem,

--  WotLK
	['interface\\icons\\inv_jewelcrafting_gem_24']			= statsColors.blueGem,
	['interface\\icons\\inv_jewelcrafting_gem_17']			= statsColors.blueGem,

	['interface\\icons\\inv_jewelcrafting_gem_27']			= statsColors.blueGem,

	['interface\\icons\\inv_jewelcrafting_dragonseye04']	= statsColors.blueGem,
	['interface\\icons\\inv_jewelcrafting_gem_42']			= statsColors.blueGem,

--  Cat
	['interface\\icons\\inv_misc_cutgemperfect3']			= statsColors.blueGem,

	['interface\\icons\\inv_misc_cutgemsuperior2']			= statsColors.blueGem,

	['interface\\icons\\inv_misc_epicgem_02']				= statsColors.blueGem,

--  MoP
	['interface\\icons\\inv_misc_gem_x4_uncommon_cut_blue']			= statsColors.blueGem,

	['interface\\icons\\inv_misc_gem_x4_uncommon_perfectcut_blue']	= statsColors.blueGem,
	['interface\\icons\\inv_misc_gem_x4_rare_cut_blue']				= statsColors.blueGem,

--  (no epic blue gem)

-- Purple
--  BC
	['interface\\icons\\inv_misc_gem_ebondraenite_02']		= statsColors.purpleGem,
	['interface\\icons\\inv_jewelcrafting_nightseye_03']	= statsColors.purpleGem,

--  WotLK
	['interface\\icons\\inv_jewelcrafting_gem_23']			= statsColors.purpleGem,
	['interface\\icons\\inv_jewelcrafting_gem_18']			= statsColors.purpleGem,

	['interface\\icons\\inv_jewelcrafting_gem_29']			= statsColors.purpleGem,

	['interface\\icons\\inv_jewelcrafting_gem_40']			= statsColors.purpleGem,

--  Cat
	['interface\\icons\\inv_misc_cutgemnormal2a']			= statsColors.purpleGem,

	['interface\\icons\\inv_misc_cutgemsuperior3']			= statsColors.purpleGem,

	['interface\\icons\\inv_misc_epicgem_05']				= statsColors.purpleGem,

--  MoP
	['interface\\icons\\inv_misc_gem_x4_uncommon_cut_purple']		= statsColors.purpleGem,

	['interface\\icons\\inv_misc_gem_x4_uncommon_perfectcut_purple']	= statsColors.purpleGem,
	['interface\\icons\\inv_misc_gem_x4_rare_cut_purple']			= statsColors.purpleGem,

--  (epic purple gem same as uncommon cut)

-- Prismatic
	['interface\\icons\\inv_misc_gem_pearl_10']				= statsColors.prismaticGem,

	['interface\\icons\\inv_enchant_voidsphere']			= statsColors.prismaticGem,
	['interface\\icons\\inv_enchant_prismaticsphere']		= statsColors.prismaticGem,

	['interface\\icons\\inv_misc_gem_pearl_12']				= statsColors.prismaticGem,

-- Meta
--  BC
	['interface\\icons\\inv_misc_gem_diamond_06']			= statsColors.metaGem,
	['interface\\icons\\inv_misc_gem_diamond_07']			= statsColors.metaGem,

--  WotLK
	['interface\\icons\\inv_jewelcrafting_icediamond_02']	= statsColors.metaGem,
	['interface\\icons\\inv_jewelcrafting_shadowspirit_02']	= statsColors.metaGem,

--  Cat
	['interface\\icons\\inv_misc_metagem_b']				= statsColors.metaGem,

--  MoP
	['interface\\icons\\inv_misc_gem_x4_metagem_cut']		= statsColors.metaGem,

-- Cogwheel
	['interface\\icons\\inv_misc_enggizmos_30']				= statsColors.cogwheel,

-- Hydraulic
--  Agility
	['interface\\icons\\inv_legendary_breathofblackprince_int'] = statsColors.hydraulicGem,
--  Strength
	['interface\\icons\\inv_legendary_breathofblackprince_agi']	= statsColors.hydraulicGem,
--  Intellect
	['interface\\icons\\inv_legendary_breathofblackprince_str']	= statsColors.hydraulicGem,
}

function StatStain2_initialize()
	DEFAULT_CHAT_FRAME:AddMessage(AppFullName)
	StatStain2_initTransform()
	StatStain2_initTooltip()
end

local function convertMatch(str)
	str = str:gsub('([%.%(%)%%%+%-%*%?%[%]%^%$])', '%%%1')
	str = str:gsub('(%%%%s)', '.+')
	str = str:gsub('(%%%%d)', '%%d+')
	str = str:gsub('(%%%%%d+d)', '%%d+')
	str = str:gsub('(%%%%f)', '%d+%%.?%%d*')
	str = str:gsub('(%%%%c)', '.')
	str = str:gsub('(%%%%%.?%d*f)', '%d+%%.?%%d*')
	return str
end

function StatStain2_initTransform()
	local new = {}
	for k, v in pairs(transforms) do
		new[convertMatch(k)] = v
	end
	transforms = new
end

function StatStain2_initTooltip()
	for _, v in ipairs(tooltips) do
		if v and type(v) == 'table' then
			StatStain2_setTooltipHook(v)
		end
	end
end

function StatStain2_addTooltip(tooltip)
	if tooltip and type(tooltip) == 'table' then
		table.insert(tooltips, tooltip)
		StatStain2_setTooltipHook(tooltip)
	end
end

function StatStain2_setTooltipHook(tooltip)
	tooltip:HookScript('OnTooltipSetItem', function(tooltip)
		StatStain2_modifyTooltip(tooltip)
	end)
end

local function parseTextColor(str)
	if str:len() ~= 8 then
		return 1.0, 1.0, 1.0, 1.0
	end
	local a, r, g, b = str:match('(%x%x)(%x%x)(%x%x)(%x%x)')
	return tonumber(r, 16) / 255, tonumber(g, 16) / 255, tonumber(b, 16) / 255, tonumber(a, 16) / 255
end

function StatStain2_modifyTooltip(tooltip)
	local regions = { tooltip:GetRegions() }
	for i = 1, #regions do
		local sobj = regions[i]
		if sobj and sobj:GetObjectType() == "FontString" then
			local text = sobj:GetText()

			if text and text ~= '' then
				local noescape = text:match('^|cffffffff(.+)|r')
				local r, g, b = sobj:GetTextColor()
				if noescape then
					text = noescape
				end
				if noescape or (r > 0.95 and g > 0.95) or (r < 0.05 and g > 0.95 and not text:match(L[': '])) then -- Don't apply to Use, Set, Chance on hit (they uses delimiter colon)
					for k, v in pairs(transforms) do
						if text:match(k) then
							if noescape then
								sobj:SetText(text)
							end
							sobj:SetTextColor(parseTextColor(v))
							break
						end
					end
				end
			end

			--[[ sobj = _G[name .. 'TextRight' .. i]
			text = sobj:GetText()
			if text and text ~= '' then
				for k, v in pairs(transforms) do
					if text:match(k) then
						sobj:SetTextColor(parseTextColor(v))
						break
					end
				end
			end ]]--
		end
	end

	local name = tooltip:GetName()
	for i = 1, 5 do
		local texture = _G[name .. 'Texture' .. i] -- TODO: Legacy code
		if texture and type(texture) == 'table' and texture.GetPoint and texture:IsShown() then
			local newColor = gems[strlower(texture:GetTexture())]
			if newColor then
				local _, parent = texture:GetPoint()
				if parent then
					local text = parent:GetText():match('^|c........(.+)$')
					if text then
						parent:SetText(text)
					end
					parent:SetTextColor(parseTextColor(newColor))
				end
			end
		end
	end

	tooltip:Show()
end

function StatStain2_onLoad()
	StatStain2_initialize()
end
