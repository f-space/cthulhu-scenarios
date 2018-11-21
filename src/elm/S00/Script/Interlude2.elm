module S00.Script.Interlude2 exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import S00.Script.Utility exposing (..)


view : Document msg
view =
    Document "幕間２"
        [ article "幕間２"
            [ branch "撃退または静観した場合"
                [ oldman "「我々は徐々に小さくなっていく掠れた風切り音にじっと耳を澄ますほかありませんでした。」"
                , zack "「施設内を彷徨う未知の生物…。研究員の失踪と無関係、とはいかないのでしょうね。」"
                , oldman "「ええ。音の消えていった先、ひとつ下の階の状況は悲惨なものでした。」"
                , narrative "曖昧に表現された惨状に記者は俯き、ただ黙ることしかできなかった。"
                , narrative "ようやく何かを紡ぎだそうと顔を上げたとき、それを遮るように老人は続けた。"
                , oldman "「脱出も救助も期待できない状況で生き延びるため、我々はひとつの決断をしました。」"
                , narrative "機を逃した記者にもはや口を挟む余地はなく、ただ固唾を飲んで次の言葉を待つ。"
                , narrative "数秒の間、そして老人は口を開いた。"
                , oldman "「奴に…あの超自然の怪物に立ち向かおう、と。」"
                ]
            , branch "気絶した場合"
                [ oldman "「我々の意識が戻ったときにはすでに奴の姿はなく、部屋にあった鉱石もまた消えていました。」"
                , zack "「未知の生物の狙いはあなた方ではなく鉱石のほうであったと。」"
                , oldman "「恐らくは。しかし、あのとき我々を生かしたのはただの気まぐれだったのかもしれません。」"
                , zack "「それは何故です。」"
                , narrative "老人のためらうような呼吸を見て、記者は無思慮に発した問いの愚かさを呪った。"
                , narrative "老人は答える。"
                , oldman "「ひとつ下の階、実験用の区画には複数の遺体が転がっていましたから。」"
                , narrative "二の句を継げずにいる記者をよそに、老人は滔々と語る。"
                , oldman "「奴との共生が不可能だと確信した我々には、立ち向かうより他に道がなかったのです。」"
                ]
            ]
        ]
