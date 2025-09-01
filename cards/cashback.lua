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
    config = { extra = { money_req = 10, money_count = 0, dollars = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money_req, card.ability.extra.money_count, card.ability.extra.money } }
    end,
    calculate = function(self, card, context)
        if context.cry_ease_dollars and to_big(context.cry_ease_dollars) < to_big(0) and not context.blueprint then
            card.ability.extra.money_count = to_big(card.ability.extra.money_count) - to_big(context.ease_dollars)
            if to_big(card.ability.extra.money_count) >= to_big(card.ability.extra.money_req) then
                while to_big(card.ability.extra.money_count) >= to_big(card.ability.extra.money_req) do
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
            for i = 1, #G.jokers.cards do
                local effects = G.jokers.cards[i]:calculate_joker( { cry_ease_dollars = mod } )
            end
        end
    end,
}