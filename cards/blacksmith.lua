SMODS.Joker = {
    key = "blacksmith",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 4, y = 1 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local scored_cards = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_face() == false then
                    scored_cards = scored_cards + 1
                    scored_card:set_ability('m_steel', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if scored_cards > 0 then
                return {
                    message = localize('k_steel')
                }
            end
        end
    end
    -- turn numbered cards into steel cards
}