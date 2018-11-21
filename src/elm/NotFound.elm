module NotFound exposing (Model, getContext, init, view)

import Browser exposing (Document)
import Context exposing (Context)
import Html exposing (..)


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
    Document "クトゥルフ神話TRPG シナリオ - Not Found -"
        [ h1 [] [ text "ページがみつかりませんでした。" ] ]
