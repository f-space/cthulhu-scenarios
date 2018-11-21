module S00.Map.M2to4Svg exposing (view)

import S00.Map.SharedSvg as Shared
import Svg as E exposing (Svg)
import Svg.Attributes as A


view : Svg msg
view =
    E.svg [ A.class "layout", A.overflow "visible", A.viewBox "0 0 2500 2500" ]
        [ Shared.defs
        , E.a [ A.xlinkHref "#elevator" ]
            [ E.g [ A.class "area" ]
                [ E.path [ A.d " M 400 2100 v 200 h -400 v -200 h 300" ] []
                , E.rect [ A.x " 150", A.y " 2300", A.width "100", A.height "50" ] []
                , E.use [ A.x " 400", A.y " 2150", A.width "75", A.height "75", A.xlinkHref "#arc4" ] []
                , E.use [ A.x " 450", A.y " 2050", A.width "100", A.height "100", A.xlinkHref "#lock" ] []
                ]
            ]
        , E.a [ A.xlinkHref "#stairs" ]
            [ E.g [ A.class "area" ]
                [ E.path [ A.d " M 300 2100 h -300 v -500 h 400 v 500 M 50 1600 v 500 m 50 -500 v 500 m 50 -500 v 500 m 50 -500 v 500 m 50 -500 v 500 m 50 -500 v 500 m 0 -250 h -300" ] []
                , E.path [ A.d " M 100 1700 h 200", A.markerEnd "url(#arrow)" ] []
                , E.path [ A.d " M 350 2000 h -200", A.markerEnd "url(#arrow)" ] []
                ]
            ]
        , E.a [ A.xlinkHref "#floor" ]
            [ E.g [ A.class "area" ]
                [ E.rect [ A.x " 400", A.y " 0", A.width "1700", A.height "2300" ] []
                ]
            ]
        ]
