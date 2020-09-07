functor
import
   System
   Application(exit:Exit)
define
   % Factorial function
   fun {Factorial N}
      % Tail recursion
      fun {Factorial N A}
         if N =< 1 then A % Base case
         else {Factorial N-1 N*A}
         end
      end
      in {Factorial N 1}
   end

   {System.showInfo {Factorial 4} }
   {Exit 0}
end
