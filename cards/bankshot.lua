--Bankshot (Uncommon) - Get 5$ if score is at most 105% of required score at end of round
SMODS.Joker {
    key = "bankshot",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 1, y = 0},
    config = { extra = { dollars = 5 }},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and G.GAME.chips / G.GAME.blind.chips <= 1.05 then
            return { 
                    message = 'Bankshot',
                    dollars = card.ability.extra.dollars 
            }
        end
    end
}