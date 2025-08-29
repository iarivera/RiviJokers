--Bankshot (Uncommon) - Get 5$ if score is at least 200% of required score at end of round
SMODS.Joker {
    key = "surplusval",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 1, y = 0 },
    config = { extra = { dollars = 5 }},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calc_dollar_bonus = function(self, card)
        if G.GAME.chips / G.GAME.blind.chips >= 2.00 then
            return card.ability.extra.dollars
        end
    end
}