-- rework so it works like certificate but only for steel cards
-- do the same for gold, glass and lucky cards
-- vending machine that spits out cola
SMODS.Joker {
    key = "blacksmith",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,
    cost = 7,
    pos = { x = 4, y = 1 },
    -- Game Crashes
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local _card = SMODS.create_card { set = "Enhanced", enhancement = "m_steel", area = G.discard }
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            _card.playing_card = G.playing_card
            table.insert(G.playing_cards, _card)

            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand:emplace(_card)
                    _card:start_materialize()
                    G.GAME.blind:debuff_card(_card)
                    G.hand:sort()
                    if context.blueprint_card then
                        context.blueprint_card:juice_up()
                    else
                        card:juice_up()
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
                    save_run()
                    return true
                end
            }))

            return nil, true
        end
    end
}