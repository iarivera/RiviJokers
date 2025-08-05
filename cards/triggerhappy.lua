
SMODS.Joker {
    key = "triggerhappy",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 0 },
    config = { extra = { odds = 6, repetitions = 2 }},
    calculate = function(self, card, context)
        -- local whoami = context.blueprint_card or card
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.repetitions,
                --card = card,
            }
        end
    end
}