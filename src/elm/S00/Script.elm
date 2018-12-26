module S00.Script exposing (Route, router, view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import S00.Script.AppendixA as AppendixA
import S00.Script.AppendixB as AppendixB
import S00.Script.Epilogue as Epilogue
import S00.Script.Interlude1 as Interlude1
import S00.Script.Interlude2 as Interlude2
import S00.Script.Prologue as Prologue
import S00.Script.Section1 as Section1
import S00.Script.Section2 as Section2
import S00.Script.Section3 as Section3
import S00.Script.Summary as Summary
import Url.Parser exposing (Parser, map, oneOf, s, top)


type Route
    = Summary
    | Prologue
    | Section1
    | Interlude1
    | Section2
    | Interlude2
    | Section3
    | Epilogue
    | AppendixA
    | AppendixB


router : Parser (Maybe Route -> a) a
router =
    oneOf
        [ map Nothing top
        , map (Just Summary) (s "summary")
        , map (Just Prologue) (s "prologue")
        , map (Just Section1) (s "section1")
        , map (Just Interlude1) (s "interlude1")
        , map (Just Section2) (s "section2")
        , map (Just Interlude2) (s "interlude2")
        , map (Just Section3) (s "section3")
        , map (Just Epilogue) (s "epilogue")
        , map (Just AppendixA) (s "appendixA")
        , map (Just AppendixB) (s "appendixB")
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
            Summary ->
                Summary.view

            Prologue ->
                Prologue.view

            Section1 ->
                Section1.view

            Interlude1 ->
                Interlude1.view

            Section2 ->
                Section2.view

            Interlude2 ->
                Interlude2.view

            Section3 ->
                Section3.view

            Epilogue ->
                Epilogue.view

            AppendixA ->
                AppendixA.view

            AppendixB ->
                AppendixB.view


decorate : Document msg -> Document msg
decorate doc =
    { doc | title = "スクリプト：" ++ doc.title }


viewTop : Document msg
viewTop =
    Document "スクリプト"
        [ content "スクリプト"
            [ nav
                [ ul
                    [ link "summary" "あらすじ"
                    , link "prologue" "序幕"
                    , link "section1" "「研究所へ」"
                    , link "interlude1" "幕間１"
                    , link "section2" "「怪物の襲来」"
                    , link "interlude2" "幕間２"
                    , link "section3" "「決戦」"
                    , link "epilogue" "終幕"
                    , link "appendixA" "付録Ａ 残された謎"
                    , link "appendixB" "付録Ｂ 設定集"
                    ]
                ]
            ]
        ]


content : String -> List (Html msg) -> Html msg
content heading =
    (::) (E.h1 [] [ text heading ])
        >> E.div [ A.id "contents", A.class "script" ]


nav : List (Html msg) -> Html msg
nav =
    E.nav []


ul : List (Html msg) -> Html msg
ul =
    List.map (List.singleton >> E.li []) >> E.ul []


link : String -> String -> Html msg
link href name =
    E.a [ A.href href ] [ text name ]
