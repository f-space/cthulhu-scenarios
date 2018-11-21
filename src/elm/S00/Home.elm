module S00.Home exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A


view : Document msg
view =
    Document "ホーム"
        [ content "メニュー"
            [ menu
                [ item "introduction" "イントロダクション"
                , item "system" "システム"
                , item "script" "スクリプト"
                , item "map" "マップ"
                , item "character" "キャラクター"
                , item "creature" "クリーチャー"
                , item "item" "アイテム"
                ]
            ]
        ]


content : String -> List (Html msg) -> Html msg
content heading =
    (::) (E.h1 [] [ text heading ])
        >> E.section [ A.id "contents", A.class "home" ]


menu : List (Html msg) -> Html msg
menu =
    E.ul [] >> List.singleton >> E.nav []


item : String -> String -> Html msg
item href label =
    E.li [] [ E.a [ A.href href ] [ text label ] ]
