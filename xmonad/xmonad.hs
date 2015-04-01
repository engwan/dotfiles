import XMonad
import XMonad.Config.Gnome
import XMonad.ManageHook
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders

myManageHook :: [ManageHook]
myManageHook =
	[ resource =? "Do" --> doIgnore
  , isFullscreen --> doFullFloat
  , className =? "Gimp-2.8" --> doFloat -- may be "Gimp" or "Gimp-2.4" instead
  , className =? "emulator-arm" --> doFloat
  , className =? "Unity-2d-panel" --> doIgnore
  , className =? "Unity-2d-launcher" --> doFloat
  ]

main = xmonad $ gnomeConfig
	{ manageHook = manageHook gnomeConfig <+> composeAll myManageHook
  , handleEventHook = fullscreenEventHook
  --, modMask = mod4Mask
  --, terminal = "terminator"
  , borderWidth = 1
  --, focusedBorderColor = "#1B2487"
  , focusedBorderColor = "#000000"
  , layoutHook = smartBorders $ layoutHook gnomeConfig
  }
