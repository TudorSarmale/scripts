#Requires AutoHotkey v2.0

; Version: 2023.06.18.1
; Usages and information: https://redd.it/orzend

class Spotify extends Spotify.Controls {

    static _hWnd := 0, _OnExit := ""

    static Restore() {
        this._Win()
        WinShow()
        WinActivate()
        Spotify._hWnd := 0
        if (IsObject(Spotify._OnExit)) {
            OnExit(Spotify._OnExit, 0)
            Spotify._OnExit := ""
        }
    }

    static _Win(Stash := false) {
        static title := "-|Spotify ahk_exe i)Spotify\.exe"
        DetectHiddenWindows(true)
        SetTitleMatchMode("RegEx")
        hWnd := WinExist(title)
        if (hWnd = 0) {
            MsgBox("Spotify is not running...", "Error", 0x40010)
            Exit()
        }
        if (Spotify._hWnd = hWnd) {
            return
        }
        Spotify._hWnd := hWnd
        visible := DllCall("IsWindowVisible", "Ptr", hWnd, "Int")
        RunWait("Spotify:")
        WinWait(title)
        if (Stash && !visible) {
            WinWaitActive()
            WinHide()
            if (!IsObject(Spotify._OnExit)) {
                Spotify._OnExit := ObjBindMethod(Spotify, "Restore")
                OnExit(Spotify._OnExit, 1)
            }
        }
    }

    class Controls {

        static _shortcuts := Map("Next", "^{Right}", "Previous", "^{Left}", "Repeat", "^r", "SeekBackward", "+{Left}", "SeekForward", "+{Right}", "Shuffle", "^s", "TogglePlay", "{Space}", "VolumeDown", "^{Down}", "VolumeUp", "^{Up}")

        static __Call(Action, *) {
            static WM_APPCOMMAND := 793
            if (!this._shortcuts.Has(Action)) {
                throw Error("Invalid action." Action, -1)
            }
            shortcut := this._shortcuts[Action]
            hActive := WinExist("A")
            this._Win(true)
            ControlFocus("Chrome Legacy Window")
            ControlSend(shortcut, "Chrome Legacy Window")
            if (Action ~= "i)^(Next|Previous|TogglePlay)$") {
                hWnd := DllCall("FindWindow", "Str", "NativeHWNDHost", "Ptr", 0)
                try PostMessage(WM_APPCOMMAND, 0x000C, 0xA0000, , hWnd)
            }
            WinActivate(hActive)
        }

    }

}