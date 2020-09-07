functor
import
   System
   Application(exit:Exit)
define
   \insert include/lists.oz

   X = [1 2 3 4 5]
   Y = [6 7 8]
   {System.show X}
   {System.show {Length X}}
   {System.show {Take X 2}}
   {System.show {Drop X 2}}
   {System.show {Append X Y}}
   {System.show {Member X 2}}
   {System.show {Member X 6}}
   {System.show {Position X 4}}
   {System.show {Position Y 8}}
   {System.show {Position X 8}}
   {Exit 0}
end
