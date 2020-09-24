functor
import
   Application
   System
define
   \insert mdc-tokenize.oz
   \insert mdc-lex.oz
   \insert mdc-interpret.oz
   \insert mdc-infix.oz

   {System.show {Interpret {Tokenize {Lex "1 2 ^ + 3 / 2 * 1 - p"}}}}
   {System.showInfo {Infix {Tokenize {Lex "1 2 ^ + 3 / 2 * 1 - p"}}}}
   {Application.exit 0}
end
