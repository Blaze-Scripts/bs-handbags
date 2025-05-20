Config = {}

-- Define all available handbags with their properties
Config.Handbags = {
    {
        model = "mp004_p_cs_jessicapurse01x",
        item = "bs_handbag_fancy",
        label = "Elegant Handbag",
        weight = 150,
        description = "An elegant handbag for special occasions",
        bone = "Skel_L_Hand",
        pos = {x = 0.43, y = 0.02, z = 0.19},
        rot = {x = 69.4, y = 176.5, z = 89.8}
    },
    {
        model = "s_penelopepurse01x",
        item = "bs_handbag_penelope",
        label = "Penelope Handbag",
        weight = 150,
        description = "A fine handbag in Penelope style",
        bone = "Skel_L_Hand",
        pos = {x = 0.35, y = -0.0, z = 0.1},
        rot = {x = 80.0, y = 180.0, z = 90.0}
    },
    {
        model = "s_pursefancy01x",
        item = "bs_handbag_purse1",
        label = "Fine Handbag",
        weight = 150,
        description = "A fine handbag for the lady of society",
        bone = "Skel_L_Hand",
        pos = {x = 0.3, y = -0.0, z = 0.1},
        rot = {x = 69.8, y = 188.2, z = 90.0}
    },
    {
        model = "s_pursefancy02x",
        item = "bs_handbag_purse2",
        label = "Ornate Handbag",
        weight = 150,
        description = "A beautifully ornate handbag",
        bone = "Skel_L_Hand",
        pos = {x = 0.4, y = 0.02, z = 0.11},
        rot = {x = 69.8, y = 188.2, z = 90.0}
    },
    {
        model = "p_bag01x",
        item = "bs_handbag_workbag",
        label = "Work Bag",
        weight = 250,
        description = "A robust bag for daily work",
        bone = "Skel_L_Hand",
        pos = {x = 0.39, y = -0.0, z = 0.2},
        rot = {x = 66.0, y = 185.0, z = 95.0}
    },
    {
        model = "p_cs_bagstrauss01x",
        item = "bs_handbag_classy",
        label = "Classy Bag",
        weight = 200,
        description = "A classic bag with timeless design",
        bone = "Skel_L_Hand",
        pos = {x = 0.40, y = -0.0, z = 0.2},
        rot = {x = 70.0, y = 178.0, z = 95.0}
    },
    {
        model = "p_bag_leather_doctor",
        item = "bs_handbag_doctor",
        label = "Doctor's Bag",
        weight = 300,
        description = "A bag for medical supplies",
        bone = "Skel_L_Hand",
        pos = {x = 0.28, y = 0.03, z = 0.12},
        rot = {x = 70.0, y = 178.0, z = 95.0}
    },
    {
        model = "p_cane01x",
        item = "bs_handbag_cane",
        label = "Walking Cane",
        weight = 200,
        description = "An elegant cane for the distinguished gentleman",
        bone = "Skel_L_Hand",
        pos = {x = 0.9, y = -0.0, z = 0.38},
        rot = {x = 66.0, y = 182.0, z = 92.0}
    },
    -- v1.1
    {
        model = "p_coalbag01x",
        item = "bs_handbag_coal",
        label = "Coal Bag",
        weight = 200,
        description = "A bag for carrying coal",
        bone = "Skel_L_Hand",
        pos = {x = 0.12, y = -0.0, z = 0.05},
        rot = {x = 0.8, y = 250.2, z = 50.0}
    },
    {
        model = "s_penelopebag01x",
        item = "bs_handbag_penelopebig",
        label = "Penelope Big Bag",
        weight = 200,
        description = "A large handbag in Penelope style",
        bone = "Skel_L_Hand",
        pos = {x = 0.55, y = -0.0, z = 0.25},
        rot = {x = 66.0, y = 185.0, z = 95.0}
    },
    {
        model = "p_cs_baglevin01x",
        item = "bs_handbag_levin",
        label = "Levin Bag",
        weight = 200,
        description = "A bag for carrying Levin",
        bone = "Skel_L_Hand",
        pos = {x = 0.1, y = 0.0, z = 0.07},
        rot = {x = 69.8, y = 188.2, z = 90.0}
    },
    {
        model = "p_cs_baganders01x",
        item = "bs_handbag_workbagdark",
        label = "Work Bag (Dark)",
        weight = 200,
        description = "A robust bag for daily work (dark)",
        bone = "Skel_L_Hand",
        pos = {x = 0.39, y = -0.0, z = 0.2},
        rot = {x = 66.0, y = 185.0, z = 95.0}
    },
    {
        model = "p_cs_purse01x",
        item = "bs_handbag_purse",
        label = "Purse",
        weight = 200,
        description = "A small handbag for the lady of society",
        bone = "Skel_L_Hand",
        pos = {x = 0.1, y = 0.0, z = 0.04},
        rot = {x = -69.8, y = 188.2, z = 90.0}
    },

}

-- Notification settings
Config.Notifications = {
    success = {
        title = "Handbag",
        equipped = "Handbag equipped",
        stowed = "Handbag stowed"
    },
    error = {
        title = "Error",
        modelLoad = "Error loading model",
        createBag = "Error creating handbag",
        unknownModel = "Unknown handbag model"
    }
}

return Config
