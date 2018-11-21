module S00.Script.Utility exposing (article, branch, conditional, direction, line, narrative, ol, oldman, p, section, ul, zack)

import Html as E exposing (Html, text)
import Html.Attributes as A
import Url


article : String -> List (Html msg) -> Html msg
article heading =
    (::) (E.h1 [] [ text heading ])
        >> E.article [ A.id "contents", A.class "script" ]


section : String -> List (Html msg) -> Html msg
section heading =
    (::) (E.h2 [] [ text heading ])
        >> E.section []


p : String -> Html msg
p =
    text >> List.singleton >> E.p []


ul : List String -> Html msg
ul =
    List.map (text >> List.singleton >> E.li []) >> E.ul []


ol : List String -> Html msg
ol =
    List.map (text >> List.singleton >> E.li []) >> E.ol []


zack : String -> Html msg
zack =
    line "0" "Zack"


oldman : String -> Html msg
oldman =
    line "1" "老人"


line : String -> String -> String -> Html msg
line palette speaker =
    text >> List.singleton >> E.p [ A.class "line", A.attribute "data-palette" palette, A.attribute "data-speaker" speaker ]


direction : String -> Html msg
direction =
    text >> List.singleton >> E.p [ A.class "direction" ]


narrative : String -> Html msg
narrative =
    text >> List.singleton >> E.p [ A.class "narrative" ]


branch : String -> List (Html msg) -> Html msg
branch =
    conditional "2"


conditional : String -> String -> List (Html msg) -> Html msg
conditional palette label children =
    let
        id =
            Url.percentEncode label
    in
    E.div [ A.class "conditional" ]
        [ E.input [ A.id id, A.type_ "checkbox" ] []
        , E.label [ A.for id, A.attribute "data-palette" palette ] [ text label ]
        , E.div [ A.class "pane" ] children
        ]
