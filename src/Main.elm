module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (..)


type Person
    = Dude
    | Dudette
    | Kiddo
    | None


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

        None ->
            "none"


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
            [ onInput (\x -> ChangePerson (stringToPerson x)) ]
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
