module S00.Map.M2to4 exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import S00.Map.M2to4Svg as Svg
import S00.Map.Utility exposing (..)


view : Document msg
view =
    Document "二階～四階"
        [ article "二階～四階"
            [ figure Svg.view
            , spot "elevator"
                "エレベーター前"
                [ p """
                    フロアに入るための扉があり、電子錠によって施錠されている。
                    どのような方法を使っても絶対に開くことはない。
                """
                , E.p []
                    [ text "エレベーターについては"
                    , a "../1f/#elevator" "一階のマップ"
                    , text "を参照。"
                    ]
                ]
            , spot "stairs"
                "階段"
                [ p "四階のみ上り階段がなく、手すりがついているだけとなっている。"
                ]
            , spot "floor"
                "フロア全体"
                [ p "入り口が施錠されているため、侵入不可。"
                , p "内部は実験用の設備があるという設定。"
                ]
            ]
        ]
