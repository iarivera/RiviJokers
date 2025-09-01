SMODS.Joker {
    key = "food",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 1, y = 1 },
    config = { extra = { Xmult = 3, Xmult_loss = 0.40 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_loss } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.Xmult - card.ability.extra.Xmult_loss <= 1.00 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                card.ability.extra.Xmult = card.ability.extra.Xmult - card.ability.extra.Xmult_loss
                return {
                    message = localize { type = 'variable', key = 'a_xmult_minus', vars = { card.ability.extra.Xmult_loss } },
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end
}