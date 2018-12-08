module S00.Map.Notes exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import S00.Map.Utility exposing (..)


view : Document msg
view =
    Document "注意事項"
        [ article "注意事項" <|
            markdown "各マップで共通する注意事項についての記述。"
                ++ [ section "外部との連絡" <| markdown """
地下への移動後は可能な限り、探索者が外部と連絡をとれないようにする必要がある。
これは探索者が救出を待つような状況が好ましくないためである。

研究所地下では携帯電話による通話やデータ通信は圏外のためできないものとする。

研究所施設内にはパソコン等の機器があるが、これらを用いてインターネットに接続することもできない。
研究所内のあらゆる電子機器は共通のサーバを介してインターネットに接続する仕組みとなっているが、
そのサーバが機能していないためである。
研究所内の電子機器同士が通信することは可能である。
"""
                   ]
        ]
