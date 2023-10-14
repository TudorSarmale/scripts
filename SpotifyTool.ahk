#Requires AutoHotkey v2.0

/*
If placing below any hotkeys that had a
previous thread change use the default:
*/
#MaxThreadsPerHotkey 1

/*
Change keys for something meaningful
This example is in alphabetical order
*/

NumpadDiv & NumpadMult::Spotify.Repeat()

NumpadMult & NumpadSub::Spotify.Shuffle()

Numpad9 & NumpadAdd::Spotify.Next()

; Dependency
#Include "C:\Users\Tudor\Documents\Spotify.ahk"