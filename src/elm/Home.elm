module Home exposing (Model, getContext, init, view)

import Browser exposing (Document)
import Context exposing (Context)
import Html exposing (..)
import Html.Attributes exposing (href, id)
import S00.Meta as S00


type alias Model =
    { context : Context }


getContext : Model -> Context
getContext =
    .context


init : Context -> Model
init =
    Model


view : Document msg
view =
    Document "クトゥルフ神話TRPG シナリオ一覧"
        [ div
            [ id "container" ]
            [ div [ id "main" ]
                [ div [ id "contents" ]
                    [ nav []
                        [ header []
                            [ h1 [] [ text "クトゥルフ神話TRPG シナリオ" ]
                            ]
                        , ul []
                            [ li []
                                [ a [ href "00" ] [ text S00.title ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
