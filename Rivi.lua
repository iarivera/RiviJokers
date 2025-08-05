-- Atlas for cards to use
SMODS.Atlas {
    key = "Rivi",
    path = "Jokers.png",
    px = 71,
    py = 95
}

local subdir = "cards"
local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(cards) do
    assert(SMODS.load_file(subdir .. "/" .. filename))()
end

--[[
SMODS.Joker {
    key = 'triggerhappy'

    loc_txt = {
        name = 'Trigger Happy',
        text = {
            "{C:green}#1# in #2#{} chance to",
            "retrigger scored card #3#{} times"
        }
    },
    config = { extra = { odds = 6, repetitions = 2 }},
    rarity = 2,
    atlas = 'Rivi',
    pos = { x = 0, y = 0 },
    cost = 6,
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

SMODS.Joker {
    key = 'bankshot',
    loc_txt = {
        name = 'Bank Shot',
        text = {
            "Earn {C:money}$#1# at",
            "end of round, when score is",
            "at most 105% of required score"
        }
    },
    config = { extra  = { money = 5 } },
    rarity = 2,
    atlas = 'Rivi',
    pos = { x = 1, y = 0}
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = card.ability.extra.money
        if bonus > 0 then return bonus end
    end,
    calculate = function(self, card, context)
        if context.end_of_round then
            if G.GAME.chips / G.GAME.blind.chips <= 1.05 then
                calc_dollar_bonus
            end
        end
    end
}
]]