module S00.Script.AppendixA exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import S00.Script.Utility exposing (..)


view : Document msg
view =
    Document "付録Ａ"
        [ article "付録Ａ 残された謎" <| markdown """
シナリオ内では深く触れなかった謎についてのメモ。

続きや関連作品を考えるときには役立つかもしれない。

## 研究所の権力者

研究所に秘密裡に地下施設を建設するためにはそれなりの立場で人を動かすことができる存在が必要である。
しかし、失踪者はみな一介の研究員であり、使われる側の人間であったと思われる。
それならば、地下施設の存在とそこで起きた事件を知りつつ黙秘した人物がどこかにいたはすである。

## クトーニアンの卵

シナリオにはクトーニアンの卵が出てくるが、その卵がその後どうなったかは一切触れていない。
もちろん、地震その他で死んでしまった可能性もあるが、幸運にも孵化して成長する可能性もある。
さらには誰かが研究所跡地から持ち去ってしまうこともあり得るかもしれない。
"""
        ]
