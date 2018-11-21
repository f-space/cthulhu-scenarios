module S00.Main exposing (Model, Msg(..), Route(..), getContext, init, router, subscriptions, update, view)

import Browser exposing (Document)
import Context exposing (Context)
import Html
import S00.Character as Character
import S00.Creature as Creature
import S00.Frame as Frame
import S00.Home as Home
import S00.Introduction as Introduction
import S00.Item as Item
import S00.Map as Map
import S00.Meta as Meta
import S00.Script as Script
import S00.System as System
import Url.Parser exposing ((</>), Parser, map, oneOf, s, top)


type Route
    = Home
    | Introduction
    | System
    | Script (Maybe Script.Route)
    | Map (Maybe Map.Route)
    | Item
    | Character
    | Creature


type alias Model =
    { context : Context
    , route : Route
    }


type Msg
    = RouteChanged Route


getContext : Model -> Context
getContext =
    .context


router : Parser (Route -> a) a
router =
    oneOf
        [ map Home top
        , map Introduction (s "introduction")
        , map System (s "system")
        , map Script (s "script" </> Script.router)
        , map Map (s "map" </> Map.router)
        , map Item (s "item")
        , map Character (s "character")
        , map Creature (s "creature")
        ]


init : Context -> Route -> Model
init context route =
    Model context route


view : Model -> Document Msg
view model =
    decorate <|
        case model.route of
            Home ->
                Home.view

            Introduction ->
                Introduction.view

            System ->
                System.view

            Script route ->
                Script.view route

            Map route ->
                Map.view route

            Item ->
                Item.view

            Character ->
                Character.view

            Creature ->
                Creature.view


decorate : Document msg -> Document msg
decorate doc =
    { doc
        | title = doc.title ++ " - " ++ Meta.title ++ " - "
        , body = Frame.view doc.body
    }


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        RouteChanged route ->
            ( { model | route = route }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
