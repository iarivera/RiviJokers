SMODS.Joker {
    key = 'cashback',
    atlas = 'Rivi',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    rarity = 1,
    cost = 2,
    pos = { x = 2, y = 1 },
    config = { extra = { money_req = 10, money_count = 0, dollars = 1, moeny_req_increase = 0 } },
    loc_vars = function(self, info_queue, card)
        -- money_count is not incrementing
        return { vars = { card.ability.extra.money_req, card.ability.extra.money_count, card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.riv_easedollars and context.riv_easedollars < 0 and not context.blueprint then
            
            card.ability.extra.money_count = card.ability.extra.money_count - context.riv_easedollars
            
            if card.ability.extra.money_count >= card.ability.extra.money_req then

                while card.ability.extra.money_count >= card.ability.extra.money_req do
                    card.ability.extra.money_count = card.ability.extra.money_count - card.ability.extra.money_req
                end
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end,
    init = function(self)
        local ed = ease_dollars
        function ease_dollars(mod, x)
            ed(mod, x)
            SMODS.calculate_context({riv_easedollars = mod}, effects)
        end
    end,
}