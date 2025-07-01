#Requires AutoHotkey v2
; キーリスト https://ahkscript.github.io/ja/docs/v2/KeyList.htm


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 関数
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 長押しで話した時に別のキーに切り替える
longPressThreshold := 300
HandleLongPressKey(key, fKey) {
    startTime := A_TickCount
    KeyWait(key)  ; キーが離されるまで待つ
    duration := A_TickCount - startTime

    if (duration >= longPressThreshold) {
        Send("{" . fKey . "}")
    } else {
        SendText(key)
    }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 英吾配列に変更
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; #1
 +2::@
 +6::^
 +7::&
 +8::*
 +9::(
 +0::)
 +-::_
  ^::=
 +^::+
 F19::`
+F19::~
; #2
@::[
[::]
; #3
 vkBB::vkBB
+vkBB::vkBA
 vkBA::'
+vkBA::"
; #4
; キー変換なし

$1:: HandleLongPressKey("1", "F1")
$2:: HandleLongPressKey("2", "F2")
$3:: HandleLongPressKey("3", "F3")
$4:: HandleLongPressKey("4", "F4")
$5:: HandleLongPressKey("5", "F5")
$6:: HandleLongPressKey("6", "F6")
$7:: HandleLongPressKey("7", "F7")
$8:: HandleLongPressKey("8", "F8")
$9:: HandleLongPressKey("9", "F9")
$0:: HandleLongPressKey("0", "F10")
$-:: HandleLongPressKey("-", "F11")
$=:: HandleLongPressKey("=", "F12")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; その他のキー
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
+Backspace::Delete
!4::Send "!{F4}"
F18::Run("wt")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; マクロ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MsgBox '　キースワップを適用しました。', '情報', '64 T1'