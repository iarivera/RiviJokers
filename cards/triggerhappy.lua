--Trigger Happy (Uncommon) 1 in 6 chance to retrigger scored card twice
SMODS.Joker {
    key = "triggerhappy",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,
    cost = 7,
    pos = { x = 0, y = 0 },
    config = { extra = { odds = 6, repetitions = 2 }},
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'riv_triggerhappy')
        return { vars = { card.ability.extra.repetitions, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only and SMODS.pseudorandom_probability(card, 'riv_triggerhappy', 1, card.ability.extra.odds) then
            return {
                repetitions = card.ability.extra.repetitions,
                message = localize('k_riv_triggerhappy_trigger')
            }
        end
    end
}