SMODS.Joker {
    key = "potentialman",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,
    cost = 7,
    pos = { x = 3, y = 1 },
    config = { extra = { odds = 7, Xmult = 7}},
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'riv_potentialman')
        return { vars = { card.ability.extra.Xmult, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then 
            if SMODS.pseudorandom_probability(card, 'riv_potentialman', 1, card.ability.extra.odds) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            else
                return {
                    message = localize('k_riv_potentialfail_ex'),
                    card = card
                }
            end
        end
    end
}