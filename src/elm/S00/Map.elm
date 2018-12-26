module S00.Map exposing (Route, router, view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import S00.Map.M1 as M1
import S00.Map.M2to4 as M2to4
import S00.Map.Mb1 as Mb1
import S00.Map.Mb2 as Mb2
import S00.Map.Notes as Notes
import Url.Parser exposing (Parser, map, oneOf, s, top)


type Route
    = Notes
    | Mb2
    | Mb1
    | M1
    | M2to4


router : Parser (Maybe Route -> a) a
router =
    oneOf
        [ map Nothing top
        , map (Just Notes) (s "notes")
        , map (Just Mb2) (s "b2f")
        , map (Just Mb1) (s "b1f")
        , map (Just M1) (s "1f")
        , map (Just M2to4) (s "2-4f")
        ]


view : Maybe Route -> Document msg
view route =
    case route of
        Just r ->
            viewChildren r

        Nothing ->
            viewTop


viewChildren : Route -> Document msg
viewChildren route =
    decorate <|
        case route of
            Notes ->
                Notes.view

            Mb2 ->
                Mb2.view

            Mb1 ->
                Mb1.view

            M1 ->
                M1.view

            M2to4 ->
                M2to4.view


decorate : Document msg -> Document msg
decorate doc =
    { doc | title = "マップ：" ++ doc.title }


viewTop : Document msg
viewTop =
    Document "マップ"
        [ content "マップ"
            [ nav
                [ ul
                    [ link "notes" "注意事項"
                    , link "2-4f" "二階～四階"
                    , link "1f" "一階"
                    , link "b1f" "地下一階"
                    , link "b2f" "地下二階"
                    ]
                ]
            ]
        ]


content : String -> List (Html msg) -> Html msg
content heading =
    (::) (E.h1 [] [ text heading ])
        >> E.div [ A.id "contents", A.class "map" ]


nav : List (Html msg) -> Html msg
nav =
    E.nav []


ul : List (Html msg) -> Html msg
ul =
    List.map (List.singleton >> E.li []) >> E.ul []


link : String -> String -> Html msg
link href name =
    E.a [ A.href href ] [ text name ]
