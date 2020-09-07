functor
import
   System
   Application(exit:Exit)
define
   PI = 355.0 / 113.0
   proc {Circle R}
      local
         A D C
      in
         A = PI * R * R
         D = 2.0 * R
         C = PI * D
         {System.showInfo A}
         {System.showInfo D}
         {System.showInfo C}
      end
   end
   {Circle 10.0}
   {Exit 0}
end
