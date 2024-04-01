" Clear any existing syntax definitions
syntax clear

" Keyword highlighting

syntax keyword tblgenKeyword assert bit bits class code dag
syntax keyword tblgenKeyword def dump else false foreach defm
syntax keyword tblgenKeyword defset defvar field if in include 
syntax keyword tblgenKeyword let list multiclass then true
syntax keyword tblgenType bit bits int string dag list

" Preprocessor directives
syntax match tblgenPreProc "^#\s*\(define\|ifndef\|ifdef\|endif\|else\)"

" Comment highlighting
syntax match tblgenComment "//.*$"
syntax match tblgenMultiLineComment "/\*\_.\{-}\*/"

" String highlighting
syntax region tblgenString start=+"+ end=+"+
syntax region tblgenString start=+'+ end=+'+

" Number highlighting
syntax match tblgenNumber "\v<\d+(\.\d*)?>"

" Define the color groups
highlight link tblgenKeyword Keyword
highlight link tblgenType Type
highlight link tblgenComment Comment
highlight link tblgenMultiLineComment Comment
highlight link tblgenString String
highlight link tblgenNumber Number
highlight link tblgenPreProc PreProc
