module S00.Map.Utility exposing (Map, Spot, article, markdown, section, viewMap, viewSpot)

import Html as E exposing (Html, text)
import Html.Attributes as A
import Markdown
import Svg exposing (Svg)
import Url


type alias Map msg =
    { name : String
    , figure : Svg msg
    , spots : List Spot
    }


type alias Spot =
    { id : String
    , name : String
    , description : String
    }


viewMap : Map msg -> Html msg
viewMap { name, figure, spots } =
    article name <| E.figure [] [ figure ] :: List.map viewSpot spots


viewSpot : Spot -> Html msg
viewSpot { id, name, description } =
    E.section [ A.id id ] <| E.h2 [] [ text name ] :: markdown description


article : String -> List (Html msg) -> Html msg
article heading =
    (::) (E.h1 [] [ text heading ])
        >> E.article [ A.id "contents", A.class "map" ]


section : String -> List (Html msg) -> Html msg
section heading =
    (::) (E.h2 [] [ text heading ])
        >> E.section []


markdown : String -> List (Html msg)
markdown =
    Markdown.toHtml Nothing
