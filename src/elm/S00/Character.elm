module S00.Character exposing (view)

import Browser exposing (Document)
import Html as E exposing (Html, text)
import Html.Attributes as A
import Markdown


type alias Character =
    { id : String
    , name : String
    , description : String
    }


type alias Group =
    { title : String
    , entries : List Character
    }


characters : List Group
characters =
    [ { title = "過去の人物"
      , entries =
            [ amelia
            , benjamin
            , carlo
            , david
            , emma
            , fred
            , gary
            ]
      }
    , { title = "現在の人物"
      , entries =
            [ zack
            , oldman
            ]
      }
    ]


amelia : Character
amelia =
    { id = "amelia"
    , name = "Amelia Anderson （アメリア・アンダーソン）"
    , description = """
女性、20代後半。
白人で金髪。

極度の虫嫌いであったが、クトーニアンのテレパシーによって徐々に虫全般に対して愛情を抱くようになる。
クトーニアン脱走の原因となる人物であり、最終的にはクトーニアンに自ら吸血され絶命。
クトーニアンに対して恐怖を覚えていたことと卵の研究を任されたことからクトーニアンに狙われた。
"""
    }


benjamin : Character
benjamin =
    { id = "benjamin"
    , name = "Benjamin Black （ベンジャミン・ブラック）"
    , description = """
男性、30代前半。
白人で茶髪。

もともと虫好きであったが、クトーニアンに対して研究を重ねる中でその異常性に恐怖し、始末するように要請する。
炭酸飲料とスナック菓子をこよなく愛するぽっちゃり系。
"""
    }


carlo : Character
carlo =
    { id = "carlo"
    , name = "Carlo Contini （カルロ・コンチーニ）"
    , description = """
男性、30代後半。
白人で黒髪。

女好きでAmeliaにアプローチを続けるイタリア人。
愛煙家でオイルライターの蒐集を趣味としている。
"""
    }


david : Character
david =
    { id = "david"
    , name = "David Dyer （デイビッド・ダイアー）"
    , description = """
男性、50代前半。
白人で茶髪。

厳格な性格の主任研究員。
超自然の生物について密かに研究していたことにより思想がカルトじみたものとなっている。
研究に強い使命感を感じており、人類のために超自然の存在を解明し、来る脅威に備えることが責務だと考えている。
"""
    }


emma : Character
emma =
    { id = "emma"
    , name = "Emma Edwards （エマ・エドワーズ）"
    , description = """
女性、30代前半。
黒人で黒髪。

真面目で秘書に近い仕事も請け負っている女性。
既婚者でEthan（イーサン）という名前の犬を飼っている。
"""
    }


fred : Character
fred =
    { id = "fred"
    , name = "Fred Ford （フレッド・フォード）"
    , description = """
男性、30代後半。
白人で金髪。

警備員その１。
"""
    }


gary : Character
gary =
    { id = "gary"
    , name = "Gary Gillan （ゲイリー・ギラン）"
    , description = """
男性、20代後半。
黒人でスキンヘッド。

警備員その２。
"""
    }


zack : Character
zack =
    { id = "zack"
    , name = "Zack Zeller （ザック・ゼラー）"
    , description = """
男性、30代前半。

アーカムプレス社に所属する記者。
老人からの要請を受けて取材のために老人の家を訪れる。
"""
    }


oldman : Character
oldman =
    { id = "oldman"
    , name = "老人"
    , description = """
性別不明、80代くらい。

探索者の未来の姿。
最終的に生き残った探索者のひとりになるため、性別や容姿などは決定できない。
探索の内容を過去の記憶として話す語り手。
"""
    }


view : Document msg
view =
    Document "キャラクター" [ article "キャラクター" <| List.map viewGroup characters ]


viewGroup : Group -> Html msg
viewGroup { title, entries } =
    section title <| List.map viewCharacter entries


viewCharacter : Character -> Html msg
viewCharacter { id, name, description } =
    E.h3 [] [ text name ]
        :: markdown description
        |> E.section [ A.id id ]


article : String -> List (Html msg) -> Html msg
article heading =
    (::) (E.h1 [] [ text heading ])
        >> E.article [ A.id "contents", A.class "character" ]


section : String -> List (Html msg) -> Html msg
section heading =
    (::) (E.h2 [] [ text heading ])
        >> E.section []


markdown : String -> List (Html msg)
markdown =
    Markdown.toHtml Nothing
