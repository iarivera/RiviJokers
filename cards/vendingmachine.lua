SMODS.Joker {
    key = "vendingmachine",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,
    cost = 7,
    pos = { x = 0, y = 2},
    config = { extra = { rounds_left = 5, creates = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.creates, card.ability.extra.rounds_left } }
    end,
    -- not decrementing
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.rounds_left - 1 <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_vending_ex'),
                    colour = G.C.FILTER
                }
            else
                card.ability.extra.rounds_left = card.ability.extra.rounds_left - 1
                return {
                    message = card.ability.extra.rounds_left .. '',
                    colour = G.C.FILTER
                }
            end
        else if 
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({key='j_diet_cola'})
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        return true
                    end
                }))
            end
        end
    end   
}
