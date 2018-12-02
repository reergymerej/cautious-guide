module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import SelectType


type Person
    = Dude
    | Dudette
    | Kiddo
    | None


type Food
    = Veggie
    | Fruit
    | Grain
    | Fish
    | MysteryFood


type Cat
    = Lion
    | Tiger
    | Jaguar


type alias Model =
    { person : Person
    , food : Food
    }


init : Model
init =
    { person = Kiddo
    , food = Fruit
    }


type Msg
    = ChangePerson Person
    | ChangeFood Food
    | ChangeCat Cat


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangePerson person ->
            { model | person = person }

        ChangeFood food ->
            { model | food = food }


viewPerson : Person -> Html Msg
viewPerson person =
    div []
        [ text (personToText person)
        ]


stringToPerson : String -> Person
stringToPerson string =
    case string of
        "dude" ->
            Dude

        "dudette" ->
            Dudette

        "kiddo" ->
            Kiddo

        _ ->
            None


personToText : Person -> String
personToText person =
    case person of
        Dude ->
            "dude"

        Dudette ->
            "dudette"

        Kiddo ->
            "kiddo"

        None ->
            "none"


personSelect =
    let
        stringToMessage =
            \x -> ChangePerson (stringToPerson x)
    in
    SelectType.viewSelect
        personToText
        stringToMessage
        []
        (\_ -> [])


persons : List Person
persons =
    [ Dude
    , Dudette
    , Kiddo
    ]


stringToFood : String -> Food
stringToFood string =
    case string of
        "fruit" ->
            Fruit

        "veggie" ->
            Veggie

        "grain" ->
            Grain

        "fish" ->
            Fish

        _ ->
            MysteryFood


foodToText : Food -> String
foodToText food =
    case food of
        Fruit ->
            "fruit"

        Veggie ->
            "veggie"

        Grain ->
            "grain"

        Fish ->
            "fish"

        MysteryFood ->
            "_"


foodSelect =
    let
        stringToMessage =
            \x -> ChangeFood (stringToFood x)

        selectAttrs =
            [ classList
                [ ( "beep", True )
                , ( "boop", True )
                ]
            ]

        optionAttrs =
            \food ->
                [ classList
                    [ ( "foo", True )
                    , ( "bar", True )
                    ]
                , id (foodToText food ++ "!")
                ]
    in
    SelectType.viewSelect
        foodToText
        stringToMessage
        selectAttrs
        optionAttrs


foods : List Food
foods =
    [ Veggie
    , Fruit
    , Grain
    , Fish
    ]


viewFood : Food -> Html Msg
viewFood food =
    div []
        [ text (foodToText food)
        ]

catSelect =
    SelectType.viewSelect =
        (\cat -> "X")
        (\string -> SelectType

view : Model -> Html Msg
view model =
    div []
        [ viewPerson model.person
        , personSelect persons model.person
        , hr [] []
        , viewFood model.food
        , foodSelect foods model.food
        , hr [] []
        , catSelect cats Jaguar
        ]


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
