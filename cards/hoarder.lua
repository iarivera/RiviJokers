-- Figure out how to make scaling work, currently doesn't scale
SMODS.Joker {
    key = "hoarder",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 3,
    cost = 7,
    pos = { x = 0, y = 1 },
    config = { extra = { Xmult = 1, Xmult_mod = 0.25 } },
    loc_vars = function(self, info_queue, card) 
        return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_mod } }
    end,
    calculate = function(self, card, context)
        if context.ending_shop and #G.consumeables.cards == G.consumeables.config.card_limit then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
            return {
                message = localize('k_upgrade_ex'),
                card = card,
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end
}