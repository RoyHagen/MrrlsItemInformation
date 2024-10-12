local MrrlFirstLogin = CreateFrame("Frame", "MrrlFirstLoginFrame")
local inNazjatar = false

local function GameTooltip_OnTooltipSetItem(tooltip)
	if not inNazjatar then return end
	local itemName, ItemLink = GameTooltip:GetItem();
	-- print(itemName.." : "..ItemLink)
	if not ItemLink then return end
	local itemString = string.match(ItemLink, "item[%-?%d:]+")
	-- print(itemString)
	local _, itemId = strsplit(":", itemString)

	if itemId and itemId == "168094" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Becomes:")
		tooltip:AddLine("1x Scrying Stone")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "168091" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Becomes:")
		tooltip:AddLine("1x Barnacled Lockbox")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "168092" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Becomes:")
		tooltip:AddLine("Mardivas reagent")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "168093" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Becomes:")
		tooltip:AddLine("3x Prismatic Manapearls")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "168095" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Becomes:")
		tooltip:AddLine("Azerite power")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "168096" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Contains:")
		tooltip:AddLine("different Nazjatar items.")
		tooltip:AddLine("Might not open if you already have the unique item in your bags.")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "168097" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Becomes:")
		tooltip:AddLine("1x Benthic Token")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "170158" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Becomes:")
		tooltip:AddLine("7x Prismatic Manapearl")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "170101" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Becomes:")
		tooltip:AddLine("1x Benthic Token")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "170162" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Contains:")
		tooltip:AddLine("different Nazjatar items.")
		tooltip:AddLine("Might not open if you already have the unique item in your bags.")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "170157" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Becomes:")
		tooltip:AddLine("Mardivas reagent")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "170152" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Becomes:")
		tooltip:AddLine("Abyssal Conch")
		tooltip:AddLine("Gives 150 rep with Nazjatar faction")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "170159" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Becomes:")
		tooltip:AddLine("3x Prismatic Manapearl")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "170153" then
		tooltip:AddLine(" ") --blank line
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Gives 150 experience to each bodyguard")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "169202" then
		tooltip:AddLine(" ")
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("Attention!")
		tooltip:AddLine("This is the mount")
		tooltip:AddLine(" Buy if you can, it will go away for a while")
		tooltip:AddLine(" ")
	end
	if itemId and itemId == "169885" then
		tooltip:AddLine(" ")
		tooltip:AddLine("-- Mrrls Item Information --")
		tooltip:AddLine("This is not consume on use!")
		tooltip:AddLine("The buff is permanent.")
		tooltip:AddLine(" ")
	end
end

-- GameTooltip:HookScript("OnTooltipSetItem", GameTooltip_OnTooltipSetItem)
local function OnEvent(self, event, ...)
	if event == "ZONE_CHANGED" or "PLAYER_LOGIN" then
		if GetSubZoneText() == "Newhome" then
			-- print("Yes we are in newhome, enable the addon")
			inNazjatar = true
		else
			-- print("We are no longer in newhome, disable the addon")
			inNazjatar = false
		end
	end
	-- if event == "PLAYER_LOGIN" then
	-- 	print(event, GetSubZoneText())
	-- end
end
TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, GameTooltip_OnTooltipSetItem)
MrrlFirstLogin:RegisterEvent("ZONE_CHANGED")
MrrlFirstLogin:RegisterEvent("PLAYER_LOGIN")
MrrlFirstLogin:SetScript("OnEvent", OnEvent)