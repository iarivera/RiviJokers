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