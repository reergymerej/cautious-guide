module SelectType exposing (viewSelect)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


viewSelect :
    (a -> String) -- Convert type to string.
    -> (String -> msg) -- Convert string to message, onInput handler.
    -> List (Attribute msg) -- Attributes for the select node.
    -> (a -> List (Attribute msg)) -- Given a type, return a list of attributes to add to its node.
    -> List a -- List of types to show as options
    -> a -- The currently selected type
    -> Html msg
viewSelect typeToString stringToMsg selectAttrs optionAttrs types selectedType =
    let
        viewOption =
            \thisType ->
                option
                    (selected (thisType == selectedType) :: optionAttrs thisType)
                    [ text (typeToString thisType) ]
    in
    select
        (onInput stringToMsg :: selectAttrs)
        (List.map viewOption types)
