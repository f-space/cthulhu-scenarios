module S00.Map.Utility exposing (a, article, figure, ol, p, section, spot, ul)

import Html as E exposing (Html, text)
import Html.Attributes as A
import Url


article : String -> List (Html msg) -> Html msg
article heading =
    (::) (E.h1 [] [ text heading ])
        >> E.article [ A.id "contents", A.class "map" ]


section : String -> List (Html msg) -> Html msg
section heading =
    (::) (E.h2 [] [ text heading ])
        >> E.section []


figure : Html msg -> Html msg
figure =
    List.singleton >> E.figure []


spot : String -> String -> List (Html msg) -> Html msg
spot id heading =
    (::) (E.h2 [] [ text heading ])
        >> E.section [ A.id id ]


p : String -> Html msg
p =
    text >> List.singleton >> E.p []


ul : List String -> Html msg
ul =
    List.map (text >> List.singleton >> E.li []) >> E.ul []


ol : List String -> Html msg
ol =
    List.map (text >> List.singleton >> E.li []) >> E.ol []


a : String -> String -> Html msg
a href =
    text >> List.singleton >> E.a [ A.href href ]
