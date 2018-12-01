module SelectType exposing (viewSelect)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


viewSelect : (String -> msg) -> (a -> String) -> List (Attribute msg) -> List (Attribute msg) -> List a -> a -> Html msg
viewSelect stringToMsg typeToString selectAttrs optionAttrs types selectedType =
    let
        viewOption =
            \x ->
                option
                    (selected (x == selectedType) :: optionAttrs)
                    [ text (typeToString x) ]
    in
    select
        (onInput stringToMsg :: selectAttrs)
        (List.map viewOption types)
