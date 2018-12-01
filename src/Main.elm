module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (..)


type Person
    = Dude
    | Dudette
    | Kiddo


persons : List Person
persons =
    [ Dude
    , Dudette
    , Kiddo
    ]


type alias Model =
    { person : Person }


init : Model
init =
    { person = Dude }


type Msg
    = ChangePerson Person


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangePerson person ->
            { model | person = person }


personToText : Person -> String
personToText person =
    case person of
        Dude ->
            "dude"

        Dudette ->
            "dudette"

        Kiddo ->
            "kiddo"


viewPerson : Person -> Html Msg
viewPerson person =
    div []
        [ text (personToText person)
        ]


view : Model -> Html Msg
view model =
    div []
        [ viewPerson model.person
        , select
            [ onInput (\x -> ChangePerson Kiddo) ]
            (List.map
                (\x -> option [] [ text (personToText x) ])
                persons
            )
        ]


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
