[BITS 16]
[ORG 0x7C00]

start:
  mov ah, 0x0E        ; テキスト表示用
  mov si, msg         ; メッセージ開始位置
print_char:
  lodsb               ; SIから文字をロード
  or al, al           ; 文字列終端（0）のチェック
  jz hang             ; 0なら終了
  int 0x10            ; BIOS割り込みで文字表示
  jmp print_char      ; 次の文字へ

hang:
  cli                 ; 割り込み禁止
  hlt                 ; 無限ループ

msg db 'Hello, World!', 0 
times 510-($-$$) db 0 
dw 0xAA55             ; ブートセクタ署名
