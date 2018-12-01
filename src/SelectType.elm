module SelectType exposing (viewSelect)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


viewSelect : (String -> msg) -> (a -> String) -> List a -> a -> Html msg
viewSelect stringToMsg typeToString types selectedType =
    let
        viewOption =
            \x -> option [ selected (x == selectedType) ] [ text (typeToString x) ]
    in
    select
        [ onInput stringToMsg ]
        (List.map viewOption types)
