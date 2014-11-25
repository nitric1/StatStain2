if GetLocale() ~= 'koKR' then return end

local L = StatStain2Locale

L['StatStain2: StatStain Rebuilt']	= 'StatStain2: StatStain Rebuilt'
L[': ']								= ': '
L['%c%d STAT']						= 'STAT %c%d' -- "민첩성 +10"
L['%s %s Damage']					= '%2$s 주문 공격력 %1$s'
L['%s - %s %s Damage']				= '%3$s 피해 %1$s~%2$s'
L['%s %s Resistance']				= '%2$s 저항력 %1$s'
L['Increases your pvp power by %s (Unique).']	= 'PvP 위력이 %s만큼 증가합니다(고유).'

L['Arcane']	= '비전'
L['Fire']	= '화염'
L['Frost']	= '냉기'
L['Nature']	= '자연'
L['Shadow']	= '암흑'
