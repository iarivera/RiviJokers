SMODS.Joker {
    key = "workboots",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = false,
    rarity = 2,
    cost = 5,
    pos = { x = 4, y = 0 },
    config = { extra = { chip_mod = 8, chips = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_mod, localize('Pair', 'poker_hands'), card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint and (next(context.poker_hands['Pair'])) then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            return {
                message = localize('k_upgrade_ex'),
                card = card,
                colour = G.C.CHIPS
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}