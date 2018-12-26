module Context exposing (Context)

import Browser.Navigation as Nav


type alias Context =
    { key : Nav.Key }
