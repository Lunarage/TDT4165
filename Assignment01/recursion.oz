functor
import
   System
   Application(exit:Exit)
define
   % Helper function for tail recursion
   fun {Go N A}
      if N == 0 then
         % Base case
         A
      else
         % Recursive case
         {Go (N-1) (A*N)}
      end
   end

   % Factorial function
   fun {Factorial N}
      % Starting with accumulated value of 1
      {Go N 1}
   end

   {System.showInfo {Factorial 1} }
   {Exit 0}
end
