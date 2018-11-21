module S00.Script.Prologue exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import S00.Script.Utility exposing (..)


view : Document msg
view =
    Document "序幕"
        [ article "序幕"
            [ direction """
                探索者のうちのひとりが老人となった未来のシーンから開始。
                未来といっても、それほど遠くない未来かつ田舎町で、住民の生活はあまり変わらないものと考える。
                記者が老人となった探索者を訪ねてくる設定。
            """
            , narrative "コンコンコンコン。"
            , zack "「アーカムプレス記者のZack Zellerです。約束通り、取材をお願いしたいのですが。」"
            , narrative "田舎町の伝統的な住居の門戸に小気味よい音が響いて数秒、扉がゆっくりと開いた。"
            , oldman "「ああ、待っていましたよ、Zellerさん。どうぞ、中へ。」"
            , narrative """
                扉の先に現れたのはひとりの老人だった。
                顔に深く刻まれた皺とは対照的に、しっかりとした足取りで先導するように中へと歩いていく。
            """
            , narrative "応接間にて軽い挨拶を済ますと、記者は小さな機械を取り出し、老人へと示しながら切り出した。"
            , direction "小さな機械は録音機器のようなもの。"
            , zack "「では早速ですが、かのハルクース研究所であなたが体験したという出来事についてお聞かせ願えますか。」"
            , oldman "「ええ、もちろん。そのためにわざわざ出向いてもらったのですから。」"
            , narrative "記者が機械のスイッチを入れ、テーブルへと置くのを見届けると、老人は静かに話し始めた。"
            , oldman "「すべてが狂ったあの日、私は研究所に居合わせ、そして幸運にも助け出されました。これは当時の報道の通りです。」"
            , narrative "記者が黙って頷くのを確認して、老人は続ける。"
            , oldman "「しかし、報道された『事実』というのは私が見た悪夢のほんの一端にすぎません。」"
            , narrative "そう言ってうつむいた老人の瞳に何か異様な凄みを感じ、記者は息を飲んだ。"
            , oldman "「悪夢への入り口は四角い小部屋に冷ややかに佇む鈍色の扉でした。」"
            , direction """
                探索者が老人の過去の姿あるいはその仲間であることをプレイヤーに告げ、自由に行動してもらう。
                この時点から、問題フェーズが始まる。
            """
            ]
        ]
