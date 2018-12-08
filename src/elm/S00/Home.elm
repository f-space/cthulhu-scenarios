module S00.Home exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A


type alias Navigation =
    List NavItem


type alias NavItem =
    { href : String
    , label : String
    }


navigation : Navigation
navigation =
    [ { href = "introduction"
      , label = "イントロダクション"
      }
    , { href = "system"
      , label = "システム"
      }
    , { href = "script"
      , label = "スクリプト"
      }
    , { href = "map"
      , label = "マップ"
      }
    , { href = "character"
      , label = "キャラクター"
      }
    , { href = "creature"
      , label = "クリーチャー"
      }
    , { href = "item"
      , label = "アイテム"
      }
    ]


view : Document msg
view =
    Document "ホーム"
        [ content "メニュー"
            [ menu <| List.map item navigation ]
        ]


content : String -> List (Html msg) -> Html msg
content heading =
    (::) (E.h1 [] [ text heading ])
        >> E.section [ A.id "contents", A.class "home" ]


menu : List (Html msg) -> Html msg
menu =
    E.ul [] >> List.singleton >> E.nav []


item : NavItem -> Html msg
item { href, label } =
    E.li [] [ E.a [ A.href href ] [ text label ] ]
