import XMonad
import XMonad.Hooks.DynamicLog
import System.IO
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.SetWMName
import Graphics.X11.ExtraTypes.XF86
--import XMonad.Actions.Volume

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"

myPP = xmobarPP { ppOrder   = \(ws:l:t:_)   -> [ws]
                , ppCurrent = xmobarColor "#429942" "" . wrap "<" ">"
                }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig { modMask = mod4Mask 
                         , terminal = "gnome-terminal"
                         , startupHook = startup >> setWMName "LG3D"
                         } `additionalKeys`
                            [ ((0, xF86XK_AudioLowerVolume ), spawn "amixer set Master 5%-")
                            , ((0, xF86XK_AudioRaiseVolume ), spawn "amixer set Master 5%+")
                            , ((0, xF86XK_AudioMute ), spawn "amixer set Master toggle")
                            ]

startup :: X ()
startup = do
    spawn "feh --bg-fill /usr/share/backgrounds/xmonad/haskell.png"
    spawn "xsetroot -cursor_name left_ptr"
