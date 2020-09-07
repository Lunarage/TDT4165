% Length of a list
fun {Length List}
   % Tail recursion
   fun {Length List A}
      case List
         of nil then A
         else {Length List.2 A+1}
      end
   end
   in {Length List 0}
end

% Returns the first Count elements of a list
fun {Take List Count}
   case List of nil then nil
   [] H|T then
      if Count > 0 then
         H|{Take T Count-1}
      else
         nil
      end
   end
end

% Returns a list without the first Count values
fun {Drop List Count}
   case List of nil then nil
   else
      if Count > 0 then
         {Drop List.2 Count-1}
      else
         List
      end
   end
end

% Returns a list off all elements in List1
% followed by all elements in List2
fun {Append List1 List2}
   case List1 of nil then List2
   [] H|T then
      H|{Append T List2}
   end
end

% Return true if Element is present in List
% false otherwise
fun {Member List Element}
   case List of nil then false
   [] H|T then
      if H == Element then true
      else {Member T Element}
      end
   end
end

% Return the position of (first occurrence of) Element in List
% Return nil if Element is not in list
fun {Position List Element}
   fun {Position List Element Index}
      case List of nil then nil
      [] H|T then
         if H == Element then Index
         else {Position T Element Index+1}
         end
      end
   end
   in {Position List Element 1}
end
