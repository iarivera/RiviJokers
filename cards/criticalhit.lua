SMODS.Joker {
    key = "criticalhit",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 3, y = 0 },
    config = { extra = { mult = 20 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mullt
            }
        end
    end
}