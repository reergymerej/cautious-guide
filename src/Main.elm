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


type alias Model =
    { person : Person }


init : Model
init =
    { person = Kiddo }


type Msg
    = ChangePerson Person


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangePerson person ->
            { model | person = person }


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
    SelectType.viewSelect stringToMessage personToText


persons : List Person
persons =
    [ Dude
    , Dudette
    , Kiddo
    ]


view : Model -> Html Msg
view model =
    div []
        [ viewPerson model.person
        , personSelect persons model.person
        ]


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
