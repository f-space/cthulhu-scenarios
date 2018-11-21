module S00.Map.SharedSvg exposing (defs)

import Html.Attributes
import Svg as E exposing (Attribute, Svg)
import Svg.Attributes as A


defs : Svg msg
defs =
    E.defs [] [ arc1, arc2, arc3, arc4, lock, arrow ]


arc1 : Svg msg
arc1 =
    E.symbol [ A.id "arc1", A.overflow "visible", A.viewBox "0 0 75 75" ]
        [ E.path [ A.d "M 0 0 H 75 A 75 75 0 0 1 0 75 V 0 Z" ] [] ]


arc2 : Svg msg
arc2 =
    E.symbol [ A.id "arc2", A.overflow "visible", A.viewBox "0 0 75 75" ]
        [ E.path [ A.d "M 75 0 V 75 A 75 75 0 0 1 0 0 H 75 Z" ] [] ]


arc3 : Svg msg
arc3 =
    E.symbol [ A.id "arc3", A.overflow "visible", A.viewBox "0 0 75 75" ]
        [ E.path [ A.d "M 75 75 H 0 A 75 75 0 0 1 75 0 V 75 Z" ] [] ]


arc4 : Svg msg
arc4 =
    E.symbol [ A.id "arc4", A.overflow "visible", A.viewBox "0 0 75 75" ]
        [ E.path [ A.d "M 0 75 V 0 A 75 75 0 0 1 75 75 H 0 Z" ] [] ]


lock : Svg msg
lock =
    E.symbol [ A.id "lock", A.overflow "visible", A.viewBox "0 0 100 100" ]
        [ E.rect [ A.x "10", A.y "30", A.width "80", A.height "60" ] []
        , E.path [ A.d "M 30 30 A 20 15 0 0 1 70 30" ] []
        , E.circle [ A.class "fill", A.cx "50", A.cy "50", A.r "10" ] []
        , E.path [ A.d "M 50 60 v 25 m 0 -15 h 15" ] []
        ]


arrow : Svg msg
arrow =
    E.marker [ A.id "arrow", A.viewBox "0 0 100 100", A.refX "0", A.refY "50", A.markerWidth "10", A.markerHeight "10", A.orient "auto" ]
        [ E.path [ A.class "fill", A.d "M 0 0 L 100 50 L 0 100 Z" ] [] ]
