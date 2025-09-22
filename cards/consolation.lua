SMODS.Joker {
    key = "consolation",
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 3, y = 1 },
    -- To Do:
    -- Implement Logic for scaling, check for any failed chance events
    config = { extra = { mult_mod = 1, mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.other_card.lucky_trigger then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
                message = localize('k_upgrade_ex'),
                card = card,
                colour = G.C.MULT
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_lucky') then
                return true
            end
        end
        return false
    end
}