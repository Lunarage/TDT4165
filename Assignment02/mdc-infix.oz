fun {Infix Tokens}
   fun {InfixInternal Tokens ExpressionStack}
      case Tokens
      of nil then
         ExpressionStack.1
      [] number(Number)|T then
         {InfixInternal T Number|ExpressionStack}
      [] operator(type:Operator)|T then
         if Operator == plus then
            Top|NextTop|Rest = ExpressionStack in
            {InfixInternal T "("#NextTop#" + "#Top#")"|Rest}
         elseif Operator == minus then
            Top|NextTop|Rest = ExpressionStack in
            {InfixInternal T "("#NextTop#" - "#Top#")"|Rest}
         elseif Operator == multiply then
            Top|NextTop|Rest = ExpressionStack in
            {InfixInternal T NextTop#" * "#Top|Rest}
         elseif Operator == divide then
            Top|NextTop|Rest = ExpressionStack in
            {InfixInternal T NextTop#" / "#Top|Rest}
         end
      [] command(Command)|T then
         if Command == print then
            {InfixInternal T ExpressionStack}
         elseif Command == duplicate then
            Top|Rest = ExpressionStack in
            {InfixInternal T Top|Top|Rest}
         elseif Command == negate then
            Top|Rest = ExpressionStack in
            {InfixInternal T "-("#Top#")"|Rest}
         elseif Command == invert then
            Top|Rest = ExpressionStack in
            {InfixInternal T "1 / "#Top|Rest}
         end
      end
   end
   in {InfixInternal Tokens nil}
end
