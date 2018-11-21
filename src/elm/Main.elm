module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Context exposing (Context)
import Home
import Html exposing (..)
import NotFound
import Route exposing (Route, parseUrl)
import S00.Main as S00
import Url


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlRequested
        , onUrlChange = UrlChanged
        }


type Model
    = NotFound NotFound.Model
    | Home Home.Model
    | S00 S00.Model


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
    | RouteChanged Route
    | S00Msg S00.Msg


getContext : Model -> Context
getContext model =
    case model of
        NotFound m ->
            NotFound.getContext m

        Home m ->
            Home.getContext m

        S00 m ->
            S00.getContext m


getKey : Model -> Nav.Key
getKey =
    getContext >> .key


normalizeUrl : Url.Url -> String
normalizeUrl url =
    let
        path =
            if String.endsWith "/" url.path then
                url.path

            else
                url.path ++ "/"
    in
    Url.toString { url | path = path }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    reset (Context key) (parseUrl url)
        |> Tuple.mapSecond (\_ -> Nav.replaceUrl key (normalizeUrl url))


reset : Context -> Route -> ( Model, Cmd Msg )
reset context route =
    let
        model =
            case route of
                Route.NotFound ->
                    NotFound (NotFound.init context)

                Route.Home ->
                    Home (Home.init context)

                Route.S00 r ->
                    S00 (S00.init context r)
    in
    ( model, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    case model of
        NotFound _ ->
            NotFound.view

        Home _ ->
            Home.view

        S00 m ->
            S00.view m |> docmap (\msg -> S00Msg msg)


docmap : (a -> msg) -> Browser.Document a -> Browser.Document msg
docmap fn doc =
    { title = doc.title
    , body = doc.body |> List.map (\e -> Html.map fn e)
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( UrlRequested request, _ ) ->
            case request of
                Browser.Internal url ->
                    ( model, Nav.pushUrl (getKey model) (normalizeUrl url) )

                Browser.External href ->
                    ( model, Nav.load href )

        ( UrlChanged url, _ ) ->
            update (RouteChanged <| parseUrl <| url) model

        ( RouteChanged route, _ ) ->
            goto model route

        ( S00Msg smsg, S00 m ) ->
            S00.update smsg m
                |> Tuple.mapBoth S00 (Cmd.map S00Msg)

        _ ->
            ( model, Cmd.none )


goto : Model -> Route -> ( Model, Cmd Msg )
goto model route =
    let
        context =
            getContext model
    in
    case ( route, model ) of
        ( Route.S00 r, S00 m ) ->
            S00.update (S00.RouteChanged r) m
                |> Tuple.mapBoth S00 (Cmd.map S00Msg)

        _ ->
            reset context route


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        S00 m ->
            S00.subscriptions m |> Sub.map S00Msg

        _ ->
            Sub.none
