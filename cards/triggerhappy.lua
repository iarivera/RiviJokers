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
    cost = 6,
    pos = { x = 0, y = 0 },
    config = { extra = { odds = 6, repetitions = 2 }},
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'riv_triggerhappy')
        return { vars = { card.ability.extra.repetitions, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        -- local whoami = context.blueprint_card or card
        if context.cardarea == G.play and context.repetition and not context.repetition_only and SMODS.psuedorandom_probability(card, 'riv_triggerhappy', 1) then
            return {
                repetitions = card.ability.extra.repetitions,
                --card = card,
                message = localize('k_bang_ex'),
            }
        end
    end
}