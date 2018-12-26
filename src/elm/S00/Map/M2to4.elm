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
フロアに入るための扉があるが、電子錠によって施錠されており基本的に開くことはない。

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

もしも何らかの手段で侵入してしまった場合には、
実験用の設備があるという設定のもと適当につくる。
"""
          }
        ]
    }


view : Document msg
view =
    Document "二階～四階" [ viewMap map ]
