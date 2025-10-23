%macro colon 2
%2:
      dq last_word
      %undef last_word
      %xdefine last_word %2
      db %1, 0 
%endmacro
