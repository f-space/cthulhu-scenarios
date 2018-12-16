module Route exposing (Route(..), parseUrl, transformUrl)

import S00.Main as S00
import Url
import Url.Parser exposing ((</>), Parser, fragment, map, oneOf, parse, s, top)


type Route
    = NotFound
    | Home
    | S00 S00.Route


router : Parser (( Route, Maybe String ) -> a) a
router =
    s "cthulhu-scenarios"
        </> oneOf
                [ map Home top
                , map S00 (s "00" </> S00.router)
                ]
        </> fragment identity
        |> map Tuple.pair


parseUrl : Url.Url -> ( Route, Maybe String )
parseUrl url =
    parse router url
        |> Maybe.withDefault ( NotFound, Nothing )


transformUrl : Url.Url -> Url.Url
transformUrl url =
    { url | path = normalizePath url.path }


normalizePath : String -> String
normalizePath path =
    if String.endsWith "/" path then
        path

    else
        path ++ "/"
