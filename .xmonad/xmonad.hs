-- Tested on Ubuntu 16.04 (Xenial).  Uses
-- https://launchpad.net/%7Egekkio/+archive/ubuntu/xmonad
-- Assumes that ~/.xinitrc has `exec xmonad` in it

import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]

main = do
    xmonad $ gnomeConfig
        { manageHook = manageDocks <+> myManageHook <+> manageHook gnomeConfig
        , layoutHook = avoidStruts  $  layoutHook gnomeConfig
        , modMask = mod4Mask
        } `additionalKeys`
        [ ((mod4Mask, xK_p), spawn "exe=`dmenu_path | dmenu $@` && (setsid $exe &)")
--                                 "exe=`dmenu_run` && eval \"exec $exe\""
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
