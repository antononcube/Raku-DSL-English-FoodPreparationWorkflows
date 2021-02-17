use DSL::Shared::Utilities::FuzzyMatching;

role DSL::English::FoodPreparationWorkflows::Grammar::FoodEntities {
    rule food-entity {
        <caramel-food-entity>    |
        <mullet-food-entity>    |
        <bergamot-food-entity>    |
        <chicken-fried-rices-food-entity>    |
        <iced-coffee-food-entity>    |
        <rum-food-entity>    |
        <salal-berries-food-entity>    |
        <marrow-food-entity>    |
        <papayas-food-entity>    |
        <pickled-vegetables-food-entity>    |
        <curry-sauce-food-entity>    |
        <grapefruits-food-entity>    |
        <lingcods-food-entity>    |
        <brussels-sprouts-food-entity>    |
        <weiner-food-entity>    |
        <dried-whole-milk-food-entity>    |
        <cashew-nuts-food-entity>    |
        <yoplait-food-entity>    |
        <milkshake-food-entity>    |
        <marionberry-food-entity>    |
        <brook-trouts-food-entity>    |
        <macaroons-food-entity>    |
        <lotus-seed-food-entity>    |
        <white-bread-food-entity>    |
        <manchets-food-entity>    |
        <turkey-breast-food-entity>    |
        <yogurt-food-entity>    |
        <gem-squashes-food-entity>    |
        <dairies-food-entity>    |
        <salts-food-entity>
    }
    rule caramel-food-entity {
        <caramel-food-word>    | 'Caramel'
    }
    rule mullet-food-entity {
        <mullet-food-word>    | 'Mullet'
    }
    rule bergamot-food-entity {
        <bergamot-food-word>    | 'Bergamot'
    }
    rule chicken-fried-rices-food-entity {
        <chicken-food-word> <fried-food-word> <rices-food-word>    | 'ChickenFriedRices'
    }
    rule iced-coffee-food-entity {
        <iced-food-word> <coffee-food-word>    | 'IcedCoffee'
    }
    rule rum-food-entity {
        <rum-food-word>    | 'Rum'
    }
    rule salal-berries-food-entity {
        <salal-food-word> <berries-food-word>    | 'SalalBerries'
    }
    rule marrow-food-entity {
        <marrow-food-word>    | 'Marrow'
    }
    rule papayas-food-entity {
        <papayas-food-word>    | 'Papayas'
    }
    rule pickled-vegetables-food-entity {
        <pickled-food-word> <vegetables-food-word>    | 'PickledVegetables'
    }
    rule curry-sauce-food-entity {
        <curry-food-word> <sauce-food-word>    | 'CurrySauce'
    }
    rule grapefruits-food-entity {
        <grapefruits-food-word>    | 'Grapefruits'
    }
    rule lingcods-food-entity {
        <lingcods-food-word>    | 'Lingcods'
    }
    rule brussels-sprouts-food-entity {
        <brussels-food-word> <sprouts-food-word>    | 'BrusselsSprouts'
    }
    rule weiner-food-entity {
        <weiner-food-word>    | 'Weiner'
    }
    rule dried-whole-milk-food-entity {
        <dried-food-word> <whole-food-word> <milk-food-word>    | 'DriedWholeMilk'
    }
    rule cashew-nuts-food-entity {
        <cashew-food-word> <nuts-food-word>    | 'CashewNuts'
    }
    rule yoplait-food-entity {
        <yoplait-food-word>    | 'Yoplait'
    }
    rule milkshake-food-entity {
        <milkshake-food-word>    | 'Milkshake'
    }
    rule marionberry-food-entity {
        <marionberry-food-word>    | 'Marionberry'
    }
    rule brook-trouts-food-entity {
        <brook-food-word> <trouts-food-word>    | 'BrookTrouts'
    }
    rule macaroons-food-entity {
        <macaroons-food-word>    | 'Macaroons'
    }
    rule lotus-seed-food-entity {
        <lotus-food-word> <seed-food-word>    | 'LotusSeed'
    }
    rule white-bread-food-entity {
        <white-food-word> <bread-food-word>    | 'WhiteBread'
    }
    rule manchets-food-entity {
        <manchets-food-word>    | 'Manchets'
    }
    rule turkey-breast-food-entity {
        <turkey-food-word> <breast-food-word>    | 'TurkeyBreast'
    }
    rule yogurt-food-entity {
        <yogurt-food-word>    | 'Yogurt'
    }
    rule gem-squashes-food-entity {
        <gem-food-word> <squashes-food-word>    | 'GemSquashes'
    }
    rule dairies-food-entity {
        <dairies-food-word>    | 'Dairies'
    }
    rule salts-food-entity {
        <salts-food-word>    | 'Salts'
    }
    token bergamot-food-word { 'bergamot' }
    token berries-food-word { 'berries' }
    token bread-food-word { 'bread' }
    token breast-food-word { 'breast' }
    token brook-food-word { 'brook' }
    token brussels-food-word { 'brussels' }
    token caramel-food-word { 'caramel' }
    token cashew-food-word { 'cashew' }
    token chicken-food-word { 'chicken' }
    token coffee-food-word { 'coffee' }
    token curry-food-word { 'curry' }
    token dairies-food-word { 'dairies' }
    token dried-food-word { 'dried' }
    token fried-food-word { 'fried' }
    token gem-food-word { 'gem' }
    token grapefruits-food-word { 'grapefruits' }
    token iced-food-word { 'iced' }
    token lingcods-food-word { 'lingcods' }
    token lotus-food-word { 'lotus' }
    token macaroons-food-word { 'macaroons' }
    token manchets-food-word { 'manchets' }
    token marionberry-food-word { 'marionberry' }
    token marrow-food-word { 'marrow' }
    token milk-food-word { 'milk' }
    token milkshake-food-word { 'milkshake' }
    token mullet-food-word { 'mullet' }
    token nuts-food-word { 'nuts' }
    token papayas-food-word { 'papayas' }
    token pickled-food-word { 'pickled' }
    token rices-food-word { 'rices' }
    token rum-food-word { 'rum' }
    token salal-food-word { 'salal' }
    token salts-food-word { 'salts' }
    token sauce-food-word { 'sauce' }
    token seed-food-word { 'seed' }
    token sprouts-food-word { 'sprouts' }
    token squashes-food-word { 'squashes' }
    token trouts-food-word { 'trouts' }
    token turkey-food-word { 'turkey' }
    token vegetables-food-word { 'vegetables' }
    token weiner-food-word { 'weiner' }
    token white-food-word { 'white' }
    token whole-food-word { 'whole' }
    token yogurt-food-word { 'yogurt' }
    token yoplait-food-word { 'yoplait' }
}