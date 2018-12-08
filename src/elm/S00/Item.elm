module S00.Item exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import Markdown


type alias Item =
    { id : String
    , name : String
    , content : Content
    }


type Content
    = Plain String
    | Chat (List Statement)


type alias Statement =
    { speaker : Speaker
    , content : String
    }


type Speaker
    = Amelia
    | Carlo
    | Emma


chatAE : Item
chatAE =
    { id = "chat-ae"
    , name = "AmeliaとEmmaのチャット"
    , content =
        Chat
            [ { speaker = Emma, content = "「これからお昼に行こうと思うんだけど、一緒にどう？」" }
            , { speaker = Amelia, content = "「ごめんなさい。今はあの子の観察を続けたいの。」" }
            , { speaker = Emma, content = "「随分と熱心ね。前はああいうの苦手じゃなかった？」" }
            , { speaker = Amelia, content = "「そうね。でも最近は興味が湧いてきて、目が離せないの。」" }
            , { speaker = Emma, content = "「そう、わかったわ。食事はまた別の機会に誘うわね。」" }
            , { speaker = Amelia, content = "「ええ、ありがとう、Emma。」" }
            ]
    }


chatCE : Item
chatCE =
    { id = "chat-ce"
    , name = "CarloとEmmaのチャット"
    , content =
        Chat
            [ { speaker = Carlo, content = "「最近のLiaは一体どうしたんだ？あれの前に張り付いてばかりじゃないか？」" }
            , { speaker = Emma, content = "「ええ、なんだか随分と熱が入っているみたいね。」" }
            , { speaker = Carlo, content = "「熱心なんてもんか！あれじゃまるで恋する乙女だ！！」" }
            , { speaker = Emma, content = "「妬いてるの？あんなものに嫉妬なんて男の器が知れるわよ？」" }
            , { speaker = Carlo, content = "「俺は心配なだけさ。可憐な花がただ虫と戯れるだけに一生を終えるのかと。」" }
            , { speaker = Emma, content = "「心配ならBenにしてやりなさいよ。彼、最近妙におどおどしてるわよ。」" }
            , { speaker = Carlo, content = "「そうか？あいつは前からあんな感じだよ。」" }
            , { speaker = Emma, content = "「あなたって、本当にイタリア男ね…」" }
            , { speaker = Carlo, content = "「最高の褒め言葉だ。」" }
            ]
    }


mailD : Item
mailD =
    { id = "mail-d"
    , name = "Davidから各研究員へのメール内容"
    , content = Plain """
研究員各位、

知人から未確認の生物を捕獲したという連絡を受けた。  
近日中にこの研究所へと搬送されてくることになるだろう。  
どうやら今まで我々が抱いてきた生物の常識を覆しかねない大物らしい。  
君たちの才知を存分に発揮して研究に臨んでほしい。

ついては、研究を円滑に進めるため君たちの担当を決定した。  
Edwards君には、生物が纏う粘液についてその特性を分析してもらう。  
Black君とContini君は、生物の組織を採取してその構造を検査してほしい。  
Anderson君には、生物が好んでいたという鉱物の特定をお願いしたい。

詳細は追って伝えるが、搬送後に速やかに研究に取り掛かることができるよう、  
各自で必要な器具や知識を調達するようにしてもらいたい。  
それでは、我々の発展の日を期待して待とう。

<br/>
David Dyer
"""
    }


mailBD : Item
mailBD =
    { id = "mail-bd"
    , name = "BenjaminとDavidのメール内容"
    , content = Plain """
### BenjaminからDavidへのメール

件名：GSQWの危険性に対する憂慮

Dyer主任、

現在研究を進めているGSQWについてですが、  
我々の想像以上に危険な生物なのではないかという疑念が生まれたため、ここに報告します。

主任はAmeliaの行動の変化にお気づきでしょうか。  
もともと彼女の虫嫌いは周知の事実でした。  
GSQWが運び込まれたときも彼女は震えており、  
一刻も早くその場を離れたい様子でした。  
それがいつの頃か、GSQWのことをじっと見つめるようになりました。  
理由を聞いたところ、そこにいなければならないから、だと彼女は答えました。  
現在、彼女はGSQWを食い入るように観察しています。

これらからGSQWには人間の精神に干渉する能力があると推察できます。  
今はまだ彼女しか影響を受けていないようですが、それも時間の問題かもしれません。  
GSQWの組織の異常性は先日報告した通りで、  
もしもGSQWがここから逃げ出すようなことがあれば壊滅的被害は免れないでしょう。

これらを鑑みて、まだGSQWが力を発揮していないうちに殺してしまうことを提案します。  
皆の安全のため、英断を期待しております。

<br/>
Benjamin Black

### Davidからの返信

件名：Re:GSQWの危険性に対する憂慮

Black君、

残念だが君の提案を受け入れることはできない。  
君は恐怖に支配され、平静を失っているようだ。

Anderson君は確かに最初は怯えているようだったが、  
彼女はもともと真面目で研究熱心な性格だ。  
研究を進めるために自身を強く律して観察を続けたのだろう。  
弱さを乗り越えた今の彼女はとても生き生きとしているように私には見える。

精神への干渉について、  
他の生物の脳に影響を与えるフェロモンの存在はないわけではないが、  
隔離された状態で特定の対象を制御するというのはいささか現実味に欠けるだろう。

もし君が冷静になり、それでもなおGSQWが危険だと考えるのであれば、  
君はなおさら研究に没頭するべきだ。  
GSQWによって我々の常識は覆された。  
今後、人類の前にはさらなる脅威が現れるかもしれない。  
そのときそれに対抗できるのは、現在の我々の研究成果だけかもしれないのだ。

人類の永劫の安寧のため、今一度、冷静になって考え直してみてほしい。  
君の勇気と決断に期待している。

<br/>
-- Dyer
"""
    }


memo : Item
memo =
    { id = "memo"
    , name = "会議室に落ちていたメモ"
    , content = Plain """
搬入口 → プール

強度低：事前に弱らせる（水）
"""
    }


geode : Item
geode =
    { id = "geode"
    , name = "鉱物に関する調査記録"
    , content = Plain """
GSQWが好んでいた鉱物に対し、
内部状態の観察を試みたところ、鉱物内部に生体反応が確認された。
生体の形状からみるに、GSQWの幼生ではないかと思われる。

また、鉱物の一部を削り、主成分を分析したところ、
現在確認されているどの鉱物とも一致しないことがわかった。
組成の分析を試みたが、分析結果と実験の結果が一致しない部分があり、さらなる検証が必要である。

以上の結果とGSQWが抱いていたという状況から推測するに、
この物体は鉱物ではなくGSQWの卵なのではないかと考えられる。
今後は発見時の状態を可能な限り再現し、GSQWの幼生の活動を観察するのがよいと思われる。
"""
    }


mucus : Item
mucus =
    { id = "mucus"
    , name = "GSQWの粘液に関する実験記録"
    , content = Plain """
GSQWの粘液に対して、あらゆる分析を試みたがその組成について正確な結果は得られなかった。
既存の分析手法における前提が満たされていないためだと思われる。
今後の研究では分析手法自体を検証、改良していく必要がある。

粘液は粘り気が強く、衝撃吸収に優れているようである。
また熱による変化にも強く、1000℃近い温度でもなおその特性を保ち続けた。
粘液は水分をほとんど含まず、また水分を吸収することもないようである。

GSQWはこの粘液を纏うことにより、外敵の攻撃を防ぐとともに、
地中および空気中の水分から身を守っているようである。

GSQWから発せられる詠唱するような掠れた風音について、
粘液内の気泡の破裂や体表面のこすれが原因ではないかという議論があったが、
実験結果を見る限りその仮説は棄却してよいと考えられる。
"""
    }


tissue : Item
tissue =
    { id = "tissue"
    , name = "GSQWの組織に関する実験記録"
    , content = Plain """
GSQWの上皮組織および筋組織を採取し、分析した結果、非常に強い生命力を示した。
採取した組織の断面では、採取後しばらくの間、組織の再生を繰り返し膨張する現象が確認された。
この現象はGSQWの本体の方でも起こっていたようで、
採取後数分の間に採取した跡が一切確認できなくなっていた。

上皮組織、筋組織ともに熱に対しては非常に高い耐性を示した。
1000℃以上の高温においても一切変形、変質することなく形を保ち続けた。

一方で水に対しては、極端に影響を受けやすいようである。
少量の水に反応して、まるで腐食するかのように急速に変色し、
最終的には溶けてなくなってしまった。
現象としては形態変化のように見られるが、液体や気体へと変化した痕跡を検出することは出来なかった。

今後は電流や放射線に対する耐性について調査していく予定である。
"""
    }


report : Item
report =
    { id = "report"
    , name = "GSQW研究報告書"
    , content = Plain """
GSQWに対する基本的な実験を行ったが、
異常性の発見こそすれ、その解明には未だ時間がかかりそうである。
実験の詳細については共有サーバ内の資料を参照のこと。

研究員からひとつ気になる報告を受けた。
研究員の一人がGSQWの研究開始より、徐々にその行動に異常性が見られるようになったという。
報告者も指摘していたが、GSQWには精神支配の能力があるように思われる。
自身が影響を受けないように注意しつつ、
今後も被験者の行動を観察することとする。
"""
    }


plan : Item
plan =
    { id = "plan"
    , name = "移送計画書"
    , content = Plain """
### 背景と目的

GSQWはその大きさのため、十分な飼育スペースを確保したケージでは施設内の移動が困難である。
そのため現在は搬入口内にケージが設置されている。
しかし、この状態では資材の搬入の妨げとなるほか、秘匿性にも難がある。
そのため、飼育場所を地下二階のプールへと移動させることとする。

### 方法

移送にはGSQWと同じサイズのケージを利用する。
GSQWを飼育用ケージから移送用ケージへと移し、電動台車を用いてプールまで移動させる。
飼育用ケージはGSQW移動後に一度解体し、プール内で再度組み上げる。

移送に用いるケージは飼育用ケージと比較すると強度の面で劣る。
そのため、GSQWが暴れた場合に破損する可能性が否定できない。
事故の可能性をできる限り低くするため移送の前にはGSQWに対して放水し、弱らせることとする。

### 担当

飼育用ケージの解体・組立：Contini, Edwards, Dyer

GSQWの運搬・放水：Black, Anderson

### 緊急時の対応

何らかの原因でGSQWがケージから逃げ出した場合には速やかに距離をとること。

GSQWの位置により搬入口かプールのいずれか近い場所に対して水を利用して追い込む。
この際、消火栓を利用できるため各自使い方と位置を把握しておくこと。
消火栓の場所については施設図を参照。

追い込みに成功した場合には飼育用ケージを組み立て、再度その中に追い込む。
失敗した場合には自身の生命を優先して退避すること。
"""
    }


egg : Item
egg =
    { id = "egg"
    , name = "クトーニアンの卵"
    , content = Plain """
晶洞石（ジオード）のような球形の鉱物に似ている。
直径30cm弱で厚さ5~8cmの殻に覆われている。

クトーニアンは卵を発見すると奪取し、守ろうとする。
"""
    }


letter : Item
letter =
    { id = "letter"
    , name = "Amelia宛のラブレターの下書き"
    , content = Plain """
Amelia嬢へと贈るCarlo渾身の作。
イタリア語で書かれており、
イタリア語ロールに成功するか、辞書や翻訳ソフトを使うと内容が読める。

内容は解読に成功したプレイヤーがその場で考える。
事実を作り上げることができるため、例えば、「君の魅力を引き立たせる魔法の小瓶を用意したよ。」
とでも書いてあれば、Carloのデスクの引き出しから香水の小瓶が出てくるかもしれない。
"""
    }


view : Document msg
view =
    Document "アイテム"
        [ article "アイテム" <|
            List.map viewItem
                [ chatAE
                , chatCE
                , mailD
                , mailBD
                , memo
                , geode
                , mucus
                , tissue
                , report
                , plan
                , egg
                , letter
                ]
        ]


viewItem : Item -> Html msg
viewItem { id, name, content } =
    E.section [ A.id id ] <| E.h2 [] [ text name ] :: viewContent content


viewContent : Content -> List (Html msg)
viewContent content =
    case content of
        Plain text ->
            markdown text

        Chat chat ->
            [ viewChat chat ]


viewChat : List Statement -> Html msg
viewChat =
    E.div [ A.class "script" ] << List.map viewStatement


viewStatement : Statement -> Html msg
viewStatement { speaker, content } =
    case speaker of
        Amelia ->
            line "5" "Amelia" content

        Carlo ->
            line "4" "Carlo" content

        Emma ->
            line "3" "Emma" content


article : String -> List (Html msg) -> Html msg
article heading =
    (::) (E.h1 [] [ text heading ])
        >> E.article [ A.id "contents", A.class "item" ]


line : String -> String -> String -> Html msg
line palette speaker s =
    E.p [ A.class "line", A.attribute "data-palette" palette, A.attribute "data-speaker" speaker ] [ text s ]


markdown : String -> List (Html msg)
markdown =
    Markdown.toHtml Nothing
