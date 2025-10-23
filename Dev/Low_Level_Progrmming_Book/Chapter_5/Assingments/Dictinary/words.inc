%include "colon.inc"

section .data 
last_word equ 0

colon "word3", word3
db "word3 value",0

colon "word2", word2
db "word2 value",0

colon "word1", word1
db "word1 value",0
