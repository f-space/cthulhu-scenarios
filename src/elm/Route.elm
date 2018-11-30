module Route exposing (Route(..), parseUrl, transformUrl)

import S00.Main as S00
import Url
import Url.Parser exposing ((</>), Parser, map, oneOf, parse, s, top)


type Route
    = NotFound
    | Home
    | S00 S00.Route


router : Parser (Route -> a) a
router =
    s "cthulhu-scenarios"
        </> oneOf
                [ map Home top
                , map S00 (s "00" </> S00.router)
                ]


parseUrl : Url.Url -> Route
parseUrl url =
    parse router url
        |> Maybe.withDefault NotFound


transformUrl : Url.Url -> Url.Url
transformUrl url =
    { url | path = normalizePath url.path }


normalizePath : String -> String
normalizePath path =
    if String.endsWith "/" path then
        path

    else
        path ++ "/"
