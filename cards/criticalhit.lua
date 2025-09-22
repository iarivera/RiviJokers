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
    -- odds 100, for 1 in 100 chance to give much higher flat mult value
    config = { extra = { odds = 100, mult = 20 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'riv_criticalhit')
        return { vars = { card.ability.extra.mult, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if SMODS.pseudorandom_probability(card, 'riv_critcalhit', 1, card.ability.extra.odds) then
                return {
                    message = localize('k_riv_criticalhit_trigger'),
                    -- consider adding a random slider to make the mult either be between 9 and 11
                    mult = card.ability.extra.mult * 10
                }
            end
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}