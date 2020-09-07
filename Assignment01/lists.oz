functor
import
   System
   Application(exit:Exit)
define
   fun {Length List}
      {System.showInfo List}
      case List of Head then
         Head
      end
   end

   fun {Take List Count}
      {System.showInfo "Not Implemented"}
   end

   fun {Drop List Count}
      {System.showInfo "Not Implemented"}
   end

   fun {Append List1 List2}
      {System.showInfo "Not Implemented"}
   end

   fun {Member List Element}
      {System.showInfo "Not Implemented"}
   end

   fun {Position List Element}
      {System.showInfo "Not Implemented"}
   end
   {System.showInfo {Length [1 2 3]}}
   {Exit 0}
end
