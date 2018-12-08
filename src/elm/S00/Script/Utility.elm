module S00.Script.Utility exposing (Script, Speaker(..), Statement(..), article, conditional, line, markdown, viewLine, viewScript, viewStatement)

import Html as E exposing (Html, text)
import Html.Attributes as A
import Markdown
import Url


type alias Script =
    List Statement


type Statement
    = If String (List Statement)
    | Direction String
    | Narrative String
    | Line Speaker String


type Speaker
    = Zack
    | Oldman


viewScript : Script -> List (Html msg)
viewScript =
    List.map viewStatement


viewStatement : Statement -> Html msg
viewStatement statement =
    case statement of
        If label section ->
            conditional "2" label <| viewScript section

        Direction content ->
            E.p [ A.class "direction" ] [ text content ]

        Narrative content ->
            E.p [ A.class "narrative" ] [ text content ]

        Line speaker content ->
            viewLine speaker content


viewLine : Speaker -> String -> Html msg
viewLine speaker content =
    case speaker of
        Zack ->
            line "0" "Zack" content

        Oldman ->
            line "1" "老人" content


article : String -> List (Html msg) -> Html msg
article heading =
    (::) (E.h1 [] [ text heading ])
        >> E.article [ A.id "contents", A.class "script" ]


line : String -> String -> String -> Html msg
line palette speaker =
    text >> List.singleton >> E.p [ A.class "line", A.attribute "data-palette" palette, A.attribute "data-speaker" speaker ]


conditional : String -> String -> List (Html msg) -> Html msg
conditional palette label children =
    let
        id =
            Url.percentEncode label
    in
    E.div [ A.class "conditional" ]
        [ E.input [ A.id id, A.type_ "checkbox" ] []
        , E.label [ A.for id, A.attribute "data-palette" palette ] [ text label ]
        , E.div [ A.class "pane" ] children
        ]


markdown : String -> List (Html msg)
markdown =
    Markdown.toHtml Nothing
