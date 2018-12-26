module S00.Script.Interlude2 exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import S00.Script.Utility exposing (..)


script : Script
script =
    [ If "撃退または静観した場合"
        [ Line Oldman "「我々は徐々に小さくなっていく掠れた風切り音にじっと耳を澄ますほかありませんでした。」"
        , Line Zack "「施設内を彷徨う未知の生物……。研究員の失踪と無関係、とはいかないのでしょうね。」"
        , Line Oldman "「ええ。音の消えていった先、ひとつ下の階の状況は悲惨なものでした。」"
        , Narrative "曖昧に表現された惨状に記者は俯き、ただ黙ることしかできなかった。"
        , Narrative "ようやく何かを紡ごうと顔を上げたとき、それを遮るように老人は続けた。"
        , Line Oldman "「脱出も救助も期待できない状況で生き延びるため、我々はひとつの決断をしました。」"
        , Narrative "機を逃した記者にもはや口を挟む余地はなく、ただ固唾を飲んで次の言葉を待った。"
        , Narrative "数秒の間、そして老人は口を開いた。"
        , Line Oldman "「奴に……あの超自然の怪物に立ち向かおう、と。」"
        ]
    , If "気絶した場合"
        [ Line Oldman "「我々の意識が戻ったときにはすでに奴の姿はなく、部屋にあった鉱石もまた消えていました。」"
        , Line Zack "「未知の生物の狙いはあなた方ではなく鉱石のほうであったと。」"
        , Line Oldman "「恐らくは。しかし、あのとき我々を生かしたのはただの気まぐれだったのかもしれません。」"
        , Line Zack "「それは何故です。」"
        , Narrative "老人のためらうような呼吸に、記者は無思慮な問いの愚かさを悟った。"
        , Narrative "老人は答える。"
        , Line Oldman "「ひとつ下の階、実験用の区画には複数の遺体が転がっていましたから。」"
        , Narrative "言葉を失う記者をよそに、老人は淡々と続けた。"
        , Line Oldman "「奴との共生が不可能だと確信した我々には、立ち向かうより他に道がなかったのです。」"
        ]
    ]


view : Document msg
view =
    Document "幕間２" [ article "幕間２" <| viewScript script ]
