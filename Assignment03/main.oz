functor
import
   Application
   System
define

% Task 1: Quadratic Equation
local
   proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
      local D in
         D = B * B - 4.0 * A * C
         if D < 0.0 then
            RealSol = false
         else
            RealSol = true
            X1 = (~B + {Sqrt D}) / (2.0 * A)
            X2 = (~B - {Sqrt D}) / (2.0 * A)
         end
      end
   end
in
   local X1 X2 RealSol in
      {System.showInfo "Quadratic Equations"}
      {QuadraticEquation 2.0 1.0 ~1.0 RealSol X1 X2}
      {System.show RealSol}
      if RealSol then
         {System.showInfo X1}
         {System.showInfo X2}
      end
   end

   local X1 X2 RealSol in
      {QuadraticEquation 2.0 1.0 2.0 RealSol X1 X2}
      {System.show RealSol}
      if RealSol then
         {System.showInfo X1}
         {System.showInfo X2}
      end
   end

   local X1 X2 RealSol in
      {System.showInfo "The Golden Ratio"}
      {QuadraticEquation 1.0 ~1.0 ~1.0 RealSol X1 X2}
      {System.show RealSol}
      if RealSol then
         {System.showInfo X1}
         {System.showInfo X2}
      end
   end
end

% Task 2: Sum List
local
   fun {Sum List}
      % Tail recursion
      fun {Sum List A}
         case List
            of nil then A
            [] H|T then {Sum T A+H}
         end
      end
      in {Sum List 0}
   end
in
   {System.showInfo "Sum List [1 2 3 4]"}
   {System.showInfo {Sum [1 2 3 4]}}
end

% Task 3
local
   fun {RightFold List Op U}
      case List
         of nil then U
         [] H|T then {Op H {RightFold T Op U}}
      end
   end

   fun {Length List}
      {RightFold List fun {$ _ X} 1 + X end 0}
   end

   fun {Sum List}
      {RightFold List fun {$ X Y} X + Y end 0}
   end
in
   {System.showInfo "Length and Sum"}
   {System.showInfo {Length [1 2 3 4]}}
   {System.showInfo {Sum [1 2 3 4]}}
end

% Task 4
local
   fun {Quadratic A B C}
      fun {$ X}
         A*X*X + B*X + C
      end
   end
in
   {System.showInfo "Quadratic"}
   {System.showInfo {{Quadratic 3 2 1 } 2}}
end

% Task 5
local
   fun {LazyNumberGenerator StartValue}
      StartValue | fun {$} {LazyNumberGenerator StartValue+1} end
   end
in
   {System.show {{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1}
end

{Application.exit 0}
end
