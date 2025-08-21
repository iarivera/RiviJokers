SMODS.Joker {
    key = "weirdjal",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 2, y = 0 },
    config = { extra = { mult = 27 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.ability.name == 'Wild Card' then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}