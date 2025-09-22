return {
    descriptions = {
        Joker = {
            j_riv_surplusval = {
                name = "Surplus Value",
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "if final score is, at least,",
                    "{C:attention}200% of required score"
                },
            },
            j_riv_triggerhappy = {
                name = "Trigger Happy",
                text = {
                    "{C:green}#2# in #3#{} chance",
                    "to retrigger {C:attention}scored{}",
                    "cards {C:attention}#1#{} times"
                }
            },
            j_riv_weirdjal = {
                name = "Weird Al Jokervic",
                text = {
                    "Scored wild cards give",
                    "{C:red}+#1#{} Mult"
                }
            },
            j_riv_criticalhit = {
                name = "Critical Hit",
                text = {
                    "{C:red}+#1#{} Mult",
                    "{C:green}#2# in #3#{} chance to",
                    "land a {C:attention}Critcal Hit{}"
                }
            },
            j_riv_workboots = {
                name = "Work Boots",
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "if played hand contains",
                    "a {C:attention}#2#",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)"
                }
            },
            j_riv_hoarder = {
                name = "Hoarder",
                text = {
                    "At end of shop",
                    "gain {X:mult,C:white} X#2# {} Mult",
                    "if consumable slots are full",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
                }
            },
            j_riv_food = {
                name = "Food",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "{X:mult,C:white} -#2# {} Mult per",
                    "round played"
                }
            },
            j_riv_cashback = {
                name = "Cashback Card",
                text = {
                    "Earn {C:money}$#3#{} for",
                    "every {C:attention}$#1#{} {C:inactive}($#2#){} spent in shop"
                }
            },
            j_riv_potentialman = {
                name = "Potential Man",
                text = {
                    "{C:green}#2# in #3#{} chance for",
                    "{X:mult,C:white} X#1# {} Mult"
                }
            },
            j_riv_consolation = {
                name = "Consolation Prize",
                text = {
                    "Gain {C:mult}+#2#{} Mult",
                    "when Lucky Card {C:attention}doesn't trigger",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
                }
            }
        }
    },
        misc = {
            dictionary = {
                k_riv_triggerhappy_trigger = "Pew!",
                k_riv_steel = "Forged!",
                k_riv_potentialfail_ex = "LOL"
            }
        }
}