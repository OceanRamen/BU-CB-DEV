local challenge = {}
challenge.NAME = 'Dyscalculia'
challenge.DESIGNER = 'ilikecheese'
challenge.DATE_CREATED = 240701
challenge.VERSION = '1.0.0'
challenge.DATA = {
    deck = {type = 'Challenge Deck'},
    rules = {
        custom = {
            {id = 'cm_omit_digits'},
            {id = 'cm_credit', value = 'ilikecheese'}
        }
    }
}
return challenge