module S00.Script.Epilogue exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import S00.Script.Utility exposing (..)


script : Script
script =
    [ If "撃破した場合"
        [ Direction "倒したときの状況によって最初の台詞は適当に変える。"
        , Line Oldman "「奴が崩れ去るのを確認し、安堵に集中を解いたその刹那、私は地面に叩かれるような衝撃を受けました。」"
        , Line Zack "「あの日、研究所を襲ったという局地的大地震ですか…。」"
        , Line Oldman "「何かに頭をぶつけたことで気を失い、次に目を覚ましたとき、私は病院のベッドに横たわっていました。」"
        ]
    , If "全滅した場合"
        [ Direction """
            例え、全員死亡であったとしても、一人は気絶で済んだということに。
            可能な限り、全員死亡するほどのダメージを与えないように制御する。
        """
        , Line Oldman "「私の意識があったのはそこまでで、次の瞬間には病院のベッドに横たわっていました。」"
        , Narrative "老人は軽く目を閉じ、深く息を吸い込み、そして吐いた。"
        , Line Oldman "「回復した私に告げられた『事実』は、局地的大地震に巻き込まれたという不可解かつ現実的なものでした。」"
        ]
    , Narrative "そこまで話すと、老人は体の力を抜いて椅子へと深く倒れこんだ。"
    , Line Zack """
        「当時の報道では偶然巻き込まれたあなた一人が奇跡的に生還したとだけ報じられています。
        あなたの、研究所の『真実』を誰かに伝えることはなさらなかったのですか。」
    """
    , Line Oldman """
        「訝しむ輩は多くいましたが、すべて追い返しました。
        信じてもらえるとは思いませんでしたし、何より当時の私には記憶を反芻することが辛かった。」
    """
    , Line Zack "「…では何故、今それを私に。」"
    , Narrative "老人は姿勢を正し、記者の瞳を正視して言った。"
    , Line Oldman """
        「人々の、人類の記憶から超自然の存在が消えてしまうことが恐ろしくなったのです。
        脅威は今なお、隣人としてそこにいるのですから。」
    """
    , Narrative "それに、と僅かな間を置いて老人は小さく呟いた。"
    , Line Oldman "「私はもう長くない。」"
    , Narrative """
        早急に会社に戻った記者は、取材を基に記事の執筆に取り掛かった。
        老人の語った『真実』をできる限り漏れなく、正確に。
    """
    , Narrative """
        記事が掲載されたのはそれから一月後のこと。
        老人の訃報が届いたのはそれからさらに三日後のことだった。
    """
    ]


view : Document msg
view =
    Document "終幕" [ article "終幕" <| viewScript script ]
