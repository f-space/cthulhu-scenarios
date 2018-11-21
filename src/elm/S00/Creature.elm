module S00.Creature exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A


type alias Header =
    ( (), String, String )


type alias Row =
    ( String, Data )


type Data
    = Each String String
    | Common String


view : Document msg
view =
    Document "クリーチャー"
        [ article "クリーチャー"
            [ creature "クトーニアン" <|
                plist [ """
                    第４脱皮段階のクトーニアン。
                    成長段階のため、テレパシーや地震の発生は限定的にしか使えない。
                    テレパシーは強く何かに恐怖しているような精神的に不安定な相手にしか効かない。
                """ ]
                    ++ [ attributes, attacks, spells ]
            ]
        ]


attributes : Html msg
attributes =
    section "能力値" <|
        plist [ "ロールはルールブック準拠、固定値はダメージボーナス低めの調整。" ]
            ++ [ table ( (), "ロール", "固定値" )
                    [ ( "STR", Each "3D6 x 4" "24" )
                    , ( "CON", Each "3D6 + 25" "40" )
                    , ( "SIZ", Each "3D6 x 4" "32" )
                    , ( "INT", Each "5D6" "16" )
                    , ( "POW", Each "4D6" "17" )
                    , ( "DEX", Each "2D6" "6" )
                    , ( "耐久力", Each "-" "36" )
                    , ( "ダメージボーナス", Each "-" "2D6" )
                    , ( "移動", Common "6 （穴掘り時1）" )
                    , ( "最大温度", Common "1500℃" )
                    , ( "耐久力再生", Common "4" )
                    , ( "装甲", Common "4" )
                    , ( "正気度消失", Common "1/1D10" )
                    ]
               ]


attacks : Html msg
attacks =
    section "攻撃" <|
        plist
            [ """
                触肢 75%。ダメージはダメージボーナスの半分（切り捨て）。
                ラウンドにつき1D8回攻撃できる。ただし、使用中の触肢がある場合にはその数だけ減少させる。
                攻撃に成功した場合にはそのまま犠牲者の主要器官へと入り込み、吸血ができる。
                シナリオ上の特殊ルールとして、攻撃成功時に壁などに叩きつけ、対象にCONx1のロールで気絶回避判定を行わせてもよい。
            """
            , """
                吸血。ラウンドごとに対象のCONを1D6減少。
                触肢攻撃成功時に移行可能。
            """
            , """
                押しつぶし 80%。ダメージはダメージボーナス同じ、かつダメージボーナスが乗る。
                回避ロールまたは跳躍ロールで回避可能。
                SIZの10で割った値と同じメートル数の範囲を攻撃。
            """
            ]


spells : Html msg
spells =
    section "呪文" <|
        plist [ "呪文は覚えていない。" ]


table : Header -> List Row -> Html msg
table ( _, h1, h2 ) rows =
    E.table []
        [ E.thead []
            [ E.tr []
                [ E.th [] []
                , E.th [] [ text h1 ]
                , E.th [] [ text h2 ]
                ]
            ]
        , E.tbody [] <| List.map row rows
        ]


row : Row -> Html msg
row ( heading, data ) =
    E.tr [] <|
        E.th [] [ text heading ]
            :: (case data of
                    Each d1 d2 ->
                        [ E.td [] [ text d1 ]
                        , E.td [] [ text d2 ]
                        ]

                    Common d ->
                        [ E.td [ A.colspan 2 ] [ text d ] ]
               )


article : String -> List (Html msg) -> Html msg
article heading =
    (::) (E.h1 [] [ text heading ])
        >> E.article [ A.id "contents", A.class "creature" ]


creature : String -> List (Html msg) -> Html msg
creature name =
    (::) (E.h2 [] [ text name ])
        >> E.section []


section : String -> List (Html msg) -> Html msg
section heading =
    (::) (E.h3 [] [ text heading ])
        >> E.section []


plist : List String -> List (Html msg)
plist =
    List.map (\s -> E.p [] [ text s ])
