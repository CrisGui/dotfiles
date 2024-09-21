if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

"syn keyword fkKeyword       import from namespace structure var const function return enumeration type if else loop for while macro
syn keyword fkTodo          FIXME TODO NOTE NOTES ALERT WARNING contained
syn keyword fkInclude       import from
syn keyword fkRepeat        loop for while in jump continue break
syn keyword fkConditional   if else finally switch
syn keyword fkStatement     namespace type return function
syn keyword fkIdentifier    const var
syn keyword fkStructure     structure enumeration
syn keyword fkMacro         macro
syn keyword fkTypeInt       Integer8 Integer16 Integer32 Integer64 Integer128 UInteger8 UInteger16 UInteger32 UInteger64 UInteger128
syn keyword fkTypeBoolean   Boolean Void Null
syn keyword fkTypeCharacter Character
syn keyword fkTypeString    String
syn keyword fkTypeFloat     Float32 Float64 UFloat32 UFloat64
syn keyword fkTypeFix       Fix32 Fix64 UFix32 UFix64
syn keyword fkTypeError     Error
syn keyword fkBoolean       true false

syn region fkMultiComment   start="/\*" end="\*/" contains=@Spell,fkTodo
syn region fkStringD        start=+"+ skip=+\\\\\|\\"+ end=+"\|$+ contains=@Spell
syn region fkStringS        start=+'+ skip=+\\\\\|\\'+ end=+'\|$+ contains=@Spell
syn region fkSpecial        start=+%{+ end=+}%+

syn match fkDecorator       "@" display contained
syn match fkDecoratorName   "@\w*\(\w|\.\)*" display contains=fkDecorator
syn match fkSingleComment   "//.*$" contains=@Spell,fkTodo
syn match fkFloat           "\<[1-9][0-9]*\.[0-9]*\>"
syn match fkDecNumber       "\<\([1-9][0-9_]*\|0\)\>"
syn match fkXBinNumber      "\<2x[0-1]*\>"
syn match fkXOctNumber      "\<8x[0-7]*\>"
syn match fkXDecNumber      "\<10x[0-9]*\>"
syn match fkXHexNumber      "\<16x[0-9a-f]*\>"
""syn match fkIdentifier      "\<[a-zA-Z][a-zA-Z0-9_]*\>"
""syn match fkFunction        "\<[a-zA-Z][a-zA-Z0-9_]*\>"

hi link fkTypeInt           fkType
hi link fkTypeUInt          fkType
hi link fkTypeBoolean       fkType
hi link fkTypeString        fkType
hi link fkTypeCharacter     fkType
hi link fkTypeFloat         fkType
hi link fkTypeFix           fkType
hi link fkTypeError         fkType
hi link fkDecNumber         fkNumber
hi link fkXDecNumber        fkNumber
hi link fkXBinNumber        fkNumber
hi link fkXOctNumber        fkNumber
hi link fkXHexNumber        fkNumber
hi link fkSingleComment     fkComment
hi link fkMultiComment      fkComment
hi link fkDecorator         fkFunction
hi link fkDecoratorName     fkFunction
hi link fkStringD           fkString
hi link fkStringS           fkString

hi link fkConstant          Constant
hi link fkCharacter         Character
hi link fkString            String
hi link fkBoolean           Boolean
hi link fkFloat             Float
hi link fkNumber            Number
hi link fkIdentifier        Identifier
hi link fkFunction          Function
hi link fkStatement         Statement
hi link fkConditional       Conditional
hi link fkRepeat            Repeat
hi link fkLabel             Label
hi link fkOperator          Operator
hi link fkKeyword           Keyword
hi link fkException         Exception
hi link fkInclude           Include
hi link fkMacro             Macro
hi link fkType              Type
hi link fkStructure         Structure
hi link fkSpecial           Special
hi link fkTypedef           Typedef
hi link fkSpecialChar       SpecialChar
hi link fkDelimiter         Delimiter
hi link fkComment           Comment
hi link fkSpecialComment    SpecialComment
hi link fkTodo              Todo
hi link fkError             Error

""Mod skipempty skipwhite
"syn keyword fkStatement return
"syn keyword fkRepeat jump
"syn keyword fkConditional if else
"syn keyword fkcTodo TODO FIXME INFO ALERT WARNING
"syn keyword fkTypedef type nextgroup=fkIdentifier skipwhite skipempty
"syn keyword fkImport import nextgroup=fkIdentifier skipwhite skipempty
"syn keyword fkStruct structure enumeration nextgroup=fkIdentifier skipwhite skipempty
"syn keyword fkKeyword function nextgroup=fkIdentifier skipwhite skipempty
"syn keyword fkKeyword macro nextgroup=fkIdentifier skipwhite skipempty
"syn keyword fkKeyword  nextgroup=fkIdentifier skipwhite skipempty
"syn keyword fkType Integer8 Integer16 Integer32 Integer64 Integer128
"syn keyword fkType UInteger8 UInteger16 UInteger32 UInteger64 UInteger128
"syn keyword fkType Float Fix Boolean
"syn match fkIdentifier contains=fkIdentifierPrime "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*"
"syn match fkFuncName "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
"
"hi link fkType Type
"hi link fkStruct Keyword
"hi link fkImport Keyword
