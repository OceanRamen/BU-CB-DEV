local Challenge = {}
Challenge.NAME = "Psychic Powers"
Challenge.DESIGNER = "Sipsy2"
Challenge.DATE_CREATED = 240702 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
    rules = {
        custom = {{
            id = 'cm_noshop'
        }},
        modifiers = {{
            id = "consumable_slots",
            value = 5
        }}
    },
    jokers = {{
        id = 'j_sixth_sense',
        edition = 'negative',
        eternal = true
    }, {
        id = 'j_seance',
        edition = 'negative',
        eternal = true
    }},
    consumeables = {},
    vouchers = {{
        id = "v_paint_brush"
    }, {
        id = "v_palette"
    }},
    deck = {
        type = "Checkered Deck"
    },
    restrictions = {
        banned_tags = {{
            id = "tag_rare"
        }, {
            id = "tag_uncommon"
        }, {
            id = "tag_holo"
        }, {
            id = "tag_polychrome"
        }, {
            id = "tag_negative"
        }, {
            id = "tag_foil"
        }, {
            id = "tag_buffoon"
        }, {
            id = "tag_coupon"
        }, {
            id = "tag_d_six"
        }, {
            id = "tag_speed"
        }, {
            id = "tag_economy"
        }, {
            id = "tag_voucher"
        }, {
            id = "tag_investment"
        }},
        banned_other = {}
    }
}

return Challenge
