functor import Application System OS define

/* Task 1 */
fun {IsOdd N}
   N mod 2 \= 0
end

fun {GenerateOdd S E}
   if S =< E then
      if {IsOdd S} then
         S|{GenerateOdd S+2 E}
      else
         {GenerateOdd S+1 E}
      end
   else
      nil
   end
end

{System.show {GenerateOdd ~3 10}}
{System.show {GenerateOdd 3 3}}
{System.show {GenerateOdd 2 2}}
{System.showInfo ""}

/* Task 2 */
fun {Product S}
   fun {Product S A}
      case S of nil then A
      [] H|T then
         {Product T H*A}
      end
   end
   in {Product S 1}
end

{System.show {Product [1 2 3 4]}}
{System.showInfo ""}

/* Task 3 */
local Numbers Prod in
   thread Numbers = {GenerateOdd 0 1000} end
   thread Prod = {Product Numbers} end
   {System.showInfo Prod}
end

{System.showInfo ""}

/* Task 4 */
fun lazy {GenerateOddLazy S E}
   if S =< E then
      if {IsOdd S} then
         S|{GenerateOddLazy S+2 E}
      else
         {GenerateOddLazy S+1 E}
      end
   else
      nil
   end
end

local Numbers Prod in
   thread Numbers = {GenerateOddLazy 0 1000} end
   thread Prod = {Product Numbers} end
   {System.showInfo Prod}
end

{System.showInfo ""}

/* Task 5 */
/* a) */
fun {RandomInt Min Max}
   X = {OS.rand}
   MinOS
   MaxOS
   in
      {OS.randLimits ?MinOS ?MaxOS}
      Min + X*(Max - Min) div (MaxOS - MinOS)
end

fun lazy {HammerFactory}
   {Delay 1000}
   {System.showInfo "Make Hammer!"}
   if {RandomInt 1 11} == 10 then
      defect|{HammerFactory}
   else
      working|{HammerFactory}
   end
end

local HammerTime B in
   HammerTime = {HammerFactory}
   B = HammerTime.2.2.2.1
   {System.show HammerTime}
end

/* b) */
fun {HammerConsumer HammerStream N}
   if N == 0 then
      0
   else
      case HammerStream of H|T then
         if H == working then
            1 + {HammerConsumer T N-1}
         else
            {HammerConsumer T N-1}
         end
      end
   end
end

local HammerTime Consumer in
   HammerTime = {HammerFactory}
   Consumer = {HammerConsumer HammerTime 10}
   {System.show Consumer}
end

/* c) */
fun {BoundedBuffer HammerStream N}
   /*
    * Lazy function to make hammers
    * Now with parallel threads
    */
   fun lazy {MakeHammer HammerStream PreMake}
      case HammerStream of H|T then
         H|{MakeHammer T thread PreMake.2 end}
      end
   end
   in
      /*
       * Drop the first N hammers to force the stream to make hammers.
       * By threading the hammer making stream
       * the hammer factory can work while another order is coming in.
       */
      {MakeHammer HammerStream thread {List.drop HammerStream N} end}
end

local HammerStream Buffer Consumer in
   HammerStream = {HammerFactory}
   Buffer = {BoundedBuffer HammerStream 6}
   {Delay 6000}
   {System.showInfo "Buffered"}
   Consumer = {HammerConsumer Buffer 10}
   {System.show Consumer}
end

local HammerStream Consumer in
   HammerStream = {HammerFactory}
   {Delay 6000}
   {System.showInfo "Not Buffered"}
   Consumer = {HammerConsumer HammerStream 10}
   {System.show Consumer}
end

{Application.exit 0}
end
