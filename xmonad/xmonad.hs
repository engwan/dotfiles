import XMonad
import XMonad.Config.Desktop

import XMonad.Util.Run (safeSpawn)
import qualified Data.Map as M
import System.Environment (getEnvironment)
import XMonad.Util.EZConfig

import XMonad.ManageHook
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders

mateConfig = desktopConfig
    { terminal = "mate-terminal"
    , keys     = mateKeys <+> keys desktopConfig
    }

mateKeys (XConfig {modMask = modm}) = M.fromList $
    [ ((modm, xK_p), mateRun)
    , ((modm .|. shiftMask, xK_q), spawn "mate-session-save --kill") ]

mateRun :: X ()
mateRun = withDisplay $ \dpy -> do
    rw <- asks theRoot
    mate_panel <- getAtom "_MATE_PANEL_ACTION"
    panel_run   <- getAtom "_MATE_PANEL_ACTION_RUN_DIALOG"

    io $ allocaXEvent $ \e -> do
        setEventType e clientMessage
        setClientMessageEvent e rw mate_panel 32 panel_run 0
        sendEvent dpy rw False structureNotifyMask e
        sync dpy False

myManageHook :: [ManageHook]
myManageHook =
	[ resource =? "Do" --> doIgnore
  , isFullscreen --> doFullFloat
  , className =? "Gimp-2.8" --> doFloat -- may be "Gimp" or "Gimp-2.4" instead
  , className =? "emulator-arm" --> doFloat
  , className =? "Unity-2d-panel" --> doIgnore
  , className =? "Unity-2d-launcher" --> doFloat
  ]

main = xmonad $ mateConfig
	{ manageHook = manageHook mateConfig <+> composeAll myManageHook
  , handleEventHook = fullscreenEventHook
  --, modMask = mod4Mask
  --, terminal = "terminator"
  , borderWidth = 1
  --, focusedBorderColor = "#1B2487"
  , focusedBorderColor = "#000000"
  , layoutHook = smartBorders $ layoutHook mateConfig
  }
