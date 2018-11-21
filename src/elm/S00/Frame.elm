module S00.Frame exposing (view)

import Html exposing (..)
import Html.Attributes exposing (id)
import S00.Meta exposing (title)


view : List (Html msg) -> List (Html msg)
view content =
    [ div [ id "container" ]
        [ header [ id "header" ]
            [ h1 [] [ text title ] ]
        , main_ [ id "main" ] content
        ]
    ]
