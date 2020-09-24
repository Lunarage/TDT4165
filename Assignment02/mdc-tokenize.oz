fun {Tokenize Lexemes}
   case Lexemes of nil
      then nil
   [] H|T then
      if H == "+" then
         operator(type:plus)|{Tokenize T}
      elseif H == "-" then
         operator(type:minus)|{Tokenize T}
      elseif H == "*" then
         operator(type:multiply)|{Tokenize T}
      elseif H == "/" then
         operator(type:divide)|{Tokenize T}
      elseif H == "p" then
         command(print)|{Tokenize T}
      elseif H == "d" then
         command(duplicate)|{Tokenize T}
      elseif H == "i" then
         command(negate)|{Tokenize T}
      elseif H == "^" then
         command(invert)|{Tokenize T}
      elseif {String.isFloat H} then
         number({String.toFloat H})|{Tokenize T}
      end
   end
end
