local images = {
    {
        [[                        (    ]],
        [[             _           ) ) ]],
        [[          _,(_)._        ((  ]],
        [[     ___,(_______).        ) ]],
        [[   ,'__.   /       \    /\_  ]],
        [[  /,' /  |""|       \  /  /  ]],
        [[ | | |   |__|       |,'  /   ]],
        [[  \`.|                  /    ]],
        [[   `. :           :    /     ]],
        [[     `.            :.,'      ]],
        [[       `-.________,-'        ]],
    },
    {
        [[           /~~~~~~\            ]],
        [[         /'    -s- ~~~~\       ]],
        [[        /'dHHb      ~~~~       ]],
        [[       /'dHHHA     :           ]],
        [[      /' VHHHHaadHHb:          ]],
        [[     /'   `VHHHHHHHHb:         ]],
        [[    /'      `VHHHHHHH:         ]],
        [[   /'        dHHHHHHH:         ]],
        [[   |        dHHHHHHHH:         ]],
        [[   |       dHHHHHHHH:          ]],
    }
}

function random_image()
    math.randomseed(os.time())
    local n = math.random(1, #images)
    return images[n]
end

require"startup".setup({
    -- every line should be same width without escaped \
    header = {
        type = "text",
        align = "left",
        fold_section = false,
        title = "Header",
        margin = 0,
        content = random_image,
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
    header_2 = {
        type = "text",
        oldfiles_directory = false,
        align = "left",
        fold_section = false,
        title = "Quote",
        margin = 5,
        content = require("startup.functions").quote(),
        highlight = "Constant",
        default_color = "",
        oldfiles_amount = 0,
    },

    clock = {
        type = "text",
        content = function()
            local clock = " " .. os.date("%H:%M")
            local date = " " .. os.date("%d-%m-%y")
            return { clock, date }
        end,
        oldfiles_directory = false,
        align = "left",
        fold_section = false,
        title = "",
        margin = 0,
        highlight = "TSString",
        default_color = "#FFFFFF",
        oldfiles_amount = 10,
    },

    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = false,
        paddings = { 2, 2, 2, 2, 2, 2, 2 },
    },
    colors = {
        background = "#181818",
        folded_section = "#56b6c2",
    },
    parts = {
        "header",
        "header_2",
        "clock",
    },
})
