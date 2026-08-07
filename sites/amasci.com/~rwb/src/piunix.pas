program MachinPi; 
var a:array[0..12965,1..5] of integer;
    r:integer; 
    c,n,s,x,z,g,h:integer;
    y:integer;
label 1;
begin
     read(z); 
     g:=round(z*1.43067); 
     if g & 1=0 then g:=succ(g);      
     h:=round(z*0.420451); 
     if h & 1=0 then h:=succ(h);      
     x:=16; 
     y:=5; 
     s:=25;
     1: 
     c:=1; 
     for n:=0 to z 
     do 
     begin 
          a[n,1]:=x div y; 
          if a[n,1]>0 then x:=x-a[n,1]*y; 
          x:=x * 10; 
          a[n,4]:=a[n,1] 
     end;
     while (y=5) or (c<h) do
     begin
          c:=c+2; 
          r:=a[0,4];
          for n:=0 to z do 
          begin
               a[n,3]:=r div s;
               if a[n,3]>0 then r:=r-a[n,3]*s;
               r:=r * 10+a[n+1,4]
          end;
          r:=a[0,3];
          for n:=0 to z do 
          begin
               a[n,4]:=a[n,3];
               a[n,2]:=r div c;
               if a[n,2]>0 then r:=r-a[n,2]*c;
               r:=r * 10+a[n+1,3]
          end;
          if c & 3=1 then 
          begin 
               for n:=z downto 0 do
               begin
                    a[n,3]:=a[n,1]+a[n,2];
                    if a[n,3]>9 then 
                    begin
                         a[n,3]:=a[n,3]-10;
			a[n-1,2]:= succ(a[n-1,2]);
                    end;
                    a[n,1]:=a[n,3] 
               end
          end;
          if c & 3=3 then 
          begin 
               for n:=z downto 0 do
               begin
                    a[n,3]:=a[n,1]-a[n,2];
                    if a[n,3]<0 then 
                    begin
                         a[n,3]:=a[n,3]+10;
			 a[n-1,2] := succ(a[n-1,2])
                    end;
                    a[n,1]:=a[n,3] 
               end
          end;
          if (y=5) and (c=g) then 
          begin
               for n:=0 to z do
                   a[n,5]:=a[n,3]; 
               x:=4; 
               y:=239; 
               s:=57121; 
               goto 1
          end
     end;
     for n:=z downto 0 do
     begin
          a[n,4]:=a[n,5]-a[n,3];
          if a[n,4]<0 then
          begin
               a[n,4]:=a[n,4]+10;
               a[n-1,3]:=succ(a[n-1,3]);
          end
     end;
     for n:=0 to z-1 do 
         write (a[n,4])
end.
