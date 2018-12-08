module S00.Map.M2to4 exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import S00.Map.M2to4Svg as Svg
import S00.Map.Utility exposing (..)


map : Map msg
map =
    { name = "二階～四階"
    , figure = Svg.view
    , spots =
        [ { id = "elevator"
          , name = "エレベーター前"
          , description = """
フロアに入るための扉があり、電子錠によって施錠されている。
どのような方法を使っても絶対に開くことはない。

エレベーターについては[一階のマップ](../1f/#elevator)を参照。
"""
          }
        , { id = "stairs"
          , name = "階段"
          , description = """
四階のみ上り階段がなく、手すりがついているだけとなっている。
"""
          }
        , { id = "floor"
          , name = "フロア全体"
          , description = """
入り口が施錠されているため、侵入不可。

内部は実験用の設備があるという設定。
"""
          }
        ]
    }


view : Document msg
view =
    Document "二階～四階" [ viewMap map ]
