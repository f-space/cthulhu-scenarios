module S00.Character exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A


view : Document msg
view =
    Document "キャラクター"
        [ article "キャラクター"
            [ section "過去の人物"
                [ amelia
                , benjamin
                , carlo
                , david
                , emma
                , fred
                , gary
                ]
            , section "現在の人物"
                [ zack
                , oldman
                ]
            ]
        ]


amelia : Html msg
amelia =
    character "amelia" "Amelia Anderson （アメリア・アンダーソン）" <|
        plist
            [ """
                女性、20代後半。
                白人で金髪。
            """
            , """
                極度の虫嫌いであったが、クトーニアンのテレパシーによって徐々に虫全般に対して愛情を抱くようになる。
                クトーニアン脱走の原因となる人物であり、最終的にはクトーニアンに自ら吸血され絶命。
                クトーニアンに対して恐怖を覚えていたことと卵の研究を任されたことからクトーニアンに狙われた。
            """
            ]


benjamin : Html msg
benjamin =
    character "benjamin" "Benjamin Black （ベンジャミン・ブラック）" <|
        plist
            [ """
                男性、30代前半。
                白人で茶髪。
            """
            , """
                もともと虫好きであったが、クトーニアンに対して研究を重ねる中でその異常性に恐怖し、始末するように要請する。
                クトーニアン脱走の際に発狂し、現場をパニックに陥れた元凶。
                炭酸飲料とスナック菓子をこよなく愛するぽっちゃり系。
            """
            ]


carlo : Html msg
carlo =
    character "carlo" "Carlo Contini （カルロ・コンチーニ）" <|
        plist
            [ """
                男性、30代後半。
                白人で黒髪。
            """
            , """
                女好きでAmeliaにアプローチを続けるイタリア人。
                愛煙家でオイルライターの蒐集を趣味としている。
            """
            ]


david : Html msg
david =
    character "david" "David Dyer （デイビッド・ダイアー）" <|
        plist
            [ """
                男性、50代前半。
                白人で茶髪。
            """
            , """
                厳格な性格の主任研究員。
                超自然の生物について密かに研究していたことにより思想がカルトじみたものとなっている。
                研究に強い使命感を感じており、人類のために超自然の存在を解明し、来る脅威に備えることが責務だと考えている。
            """
            ]


emma : Html msg
emma =
    character "emma" "Emma Edwards （エマ・エドワーズ）" <|
        plist
            [ """
                女性、30代前半。
                黒人で黒髪。
            """
            , """
                真面目で秘書に近い仕事も請け負っている女性。
                既婚者でEthan（イーサン）という名前の犬を飼っている。
            """
            ]


fred : Html msg
fred =
    character "fred" "Fred Ford （フレッド・フォード）" <|
        plist
            [ """
                男性、30代後半。
                白人で金髪。
            """
            , """
                警備員その１。
            """
            ]


gary : Html msg
gary =
    character "gary" "Gary Gillan （ゲイリー・ギラン）" <|
        plist
            [ """
                男性、20代後半。
                黒人でスキンヘッド。
            """
            , """
                警備員その２。
            """
            ]


zack : Html msg
zack =
    character "zack" "Zack Zeller （ザック・ゼラー）" <|
        plist
            [ """
                男性、30代前半。
            """
            , """
                アーカムプレス社に所属する記者。
                老人からの要請を受けて取材のために老人の家を訪れる。
            """
            ]


oldman : Html msg
oldman =
    character "oldman" "老人" <|
        plist
            [ """
                性別不明、80代くらい。
            """
            , """
                探索者の未来の姿。
                最終的に生き残った探索者のひとりになるため、性別や容姿などは決定できない。
                探索の内容を過去の記憶として話す語り手。
            """
            ]


article : String -> List (Html msg) -> Html msg
article heading =
    (::) (E.h1 [] [ text heading ])
        >> E.article [ A.id "contents", A.class "character" ]


section : String -> List (Html msg) -> Html msg
section heading =
    (::) (E.h2 [] [ text heading ])
        >> E.section []


character : String -> String -> List (Html msg) -> Html msg
character id name =
    (::) (E.h3 [] [ text name ])
        >> E.section [ A.id id ]


plist : List String -> List (Html msg)
plist =
    List.map (\s -> E.p [] [ text s ])
