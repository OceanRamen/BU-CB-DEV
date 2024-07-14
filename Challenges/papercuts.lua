local challenge = {}
challenge.NAME = 'Papercuts'
challenge.DESIGNER = 'ilikecheese'
challenge.DATE_CREATED = 240701
challenge.VERSION = '1.0.0'
challenge.DATA = {
    deck = {type = 'Challenge Deck'},
    rules = {
        custom = {
            {id = 'cm_lose_money_on_select'},
            {id = 'cm_credit', value = 'ilikecheese'}
        },
        modifiers = {
            {id = 'dollars', value = 25},
        }
    },
    jokers = {
        {id = 'j_joker'},
        {id = 'j_golden'},
    },
    vouchers = {
        {id = 'v_clearance_sale'},
    }
}
return challenge