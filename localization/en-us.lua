return {
    descriptions = {
        Joker = {
            j_riv_bankshot = {
                name = "Bankshot",
                text = {
                    "Get {C:money}$#1#{} at end of round",
                    "if final score is, at most,",
                    "{C:attention}105% of required score"
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
                name = "Weird Jal",
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
            }
        }
    },
        misc = {
            dictionary = {
                k_riv_triggerhappy_trigger = "Pew!",
                k_riv_criticalhit_trigger = "SMAAAASH!!"
            }
        }
}