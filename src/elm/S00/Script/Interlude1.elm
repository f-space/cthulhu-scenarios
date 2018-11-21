module S00.Script.Interlude1 exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import S00.Script.Utility exposing (..)


view : Document msg
view =
    Document "幕間１"
        [ article "幕間１"
            [ oldman "「こうして我々は封ぜられた区画へと足を踏み入れることになったのです。」"
            , zack "「秘密の地下施設ですか…。」"
            , narrative "老人は絶えず緊張の面持ちを崩さなかったが、その声はどこか弾んでいるようにも聞こえる。"
            , zack "「認証された職員証は誰のものだったのでしょうか。」"
            , oldman "「Amelia Anderson女史であったと記憶しています。」"
            , zack "「Anderson氏というと、件の被害者の一人ですね。そして失踪者の一人でも。」"
            , narrative "そう言って記者は手帳を取り出し、ページをひらひらとめくった。"
            , zack """
                「陰謀説を唱えるオカルトマニアの間では、彼女は物語のスパイスとして有名なようです。
                なんでも生物学者としては致命的なまでに虫嫌いであった彼女が、失踪直前には虫に執着していたとか。」
            """
            , narrative "手帳を閉じて顔を上げた記者は、鋭い眼光を向ける老人に気づき慌てて言葉を切った。"
            , zack """
                「馬鹿馬鹿しい話ですが失踪者の奇妙な噂がいくつか残っていましてね。
                些事でも積もれば関心を集めるようで。
                失礼、話を遮ってしまいました。
                続きをお願いできますか。」
            """
            , oldman "「…ええ。」"
            , narrative "老人は表情を僅かに和らげると、微かに震えた声で語り始めた。"
            , oldman "「我々が超自然の存在を初めて体感したのも、そのAnderson女史の、奥まった場所にある研究室から出ようとしたのことでした。」"
            ]
        ]
