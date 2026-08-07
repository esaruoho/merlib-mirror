{(c) Richard Bean, 1990, some improvements suggested by David Wilson -
using and instead of mod, and shl instead of *.
machinpi.pas - a program to calculate pi using an arctangent
formula discovered by John Machin in 1706:
pi = 16 * arctan (1/5) - 4 * arctan (1/239)
Due to 64k segment restrictions in Turbo Pascal only 12965
decimal places can be calculated at once.  The 5 arrays could
be cut to 4 at the expense of program speed.}
{$s-,r-,b-,i-,d-,l-,e-,n-,v-} {kill all checks for speed and space}
var a:array[0..12965,1..5] of shortint; {5 arrays containing all the digits
                                        in a base 10 representation}
    r:longint; {r stores the remainder - if it gets longer than 9
                digits, i.e. if there is a string of repeated digits longer
                than 9, this will overflow.  This doesn't occur within
                the first 1 000 000 digits.}
    c,n,s,x,z,g,h:word;
    y:byte; {the divisor - 5 or 239 depending on the term}
label 1;
begin
     read(z); {z is how many decimal places we want to calculate}
     g:=round(z*1.430676558073393); {g is the number of terms required
                                    for the arctan(1/5) term}
     if g and 1=0 then inc(g);      {make it even}
     h:=round(z*0.420451094243463); {h is the number of terms required
                                    for the arctan(1/239) term}
     if h and 1=0 then inc(h);      {make it even}
     x:=16; {multiplier in first arctangent expansion}
     y:=5;  {divisor in first arctangent expansion - from 1/5}
     s:=25; {divisor squared}
     1: {first label}
     c:=1; {divisor of first term in arctangent expansion}
     for n:=0 to z do {for all the decimal places}
     begin {dividing x by y to z decimal places}
          a[n,1]:=x div y; {first digit}
          if a[n,1]>0 then x:=x-a[n,1]*y; {if not 0, subtract remainder}
          x:=x shl 3+x shl 1; {and multiply by 10 for next division}
          a[n,4]:=a[n,1] {also store in the fourth array}
     end;
     while (y=5) or (c<h) do
     begin
          c:=c+2; {the odd numbers are the divisors}
          r:=a[0,4];
          for n:=0 to z do {divide array 4 by the term, ie 5 or 239, squared}
          begin
               a[n,3]:=r div s;
               if a[n,3]>0 then r:=r-a[n,3]*s;
               r:=r shl 3+r shl 1+a[n+1,4]
               {multiply by 10 and add next digit}
          end;
          r:=a[0,3];
          for n:=0 to z do {divide array 3 by c, which is 1,3,5,7,9...}
          begin
               a[n,4]:=a[n,3];
               a[n,2]:=r div c;
               if a[n,2]>0 then r:=r-a[n,2]*c;
               r:=r shl 3+r shl 1+a[n+1,3]
          end;
          if c and 3=1 then {if c mod 4=1 then add to total}
          begin {adding array 2 to array 1, result in array 3}
               for n:=z downto 0 do
               begin
                    a[n,3]:=a[n,1]+a[n,2];
                    if a[n,3]>9 then {if carry}
                    begin
                         a[n,3]:=a[n,3]-10;inc(a[n-1,2])
                    end;
                    a[n,1]:=a[n,3] {store array 3 in array 1}
               end
          end;
          if c and 3=3 then {if c mod 4=3 then subtract from total}
          begin {subtracting array 2 from array 1, result in array 3}
               for n:=z downto 0 do
               begin
                    a[n,3]:=a[n,1]-a[n,2];
                    if a[n,3]<0 then {if carry}
                    begin
                         a[n,3]:=a[n,3]+10;inc(a[n-1,2])
                    end;
                    a[n,1]:=a[n,3] {store array 3 in array 1}
               end
          end;
          if (y=5) and (c=g) then {if first series is over}
          begin
               for n:=0 to z do
                   a[n,5]:=a[n,3]; {store array 3 in array 5}
               x:=4; {second multiplier}
               y:=239; {second divisor}
               s:=57121; {second divisor squared}
               goto 1
          end
     end;
     for n:=z downto 0 do
     begin
     {subtract array 3 from array 5, and put result in array 4}
          a[n,4]:=a[n,5]-a[n,3];
          if a[n,4]<0 then
          begin
               a[n,4]:=a[n,4]+10;
               inc(a[n-1,3])
          end
     end;
     for n:=0 to z-1 do {write out all the digits from array 4}
         write (a[n,4])
end.