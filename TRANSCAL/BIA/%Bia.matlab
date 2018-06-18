clc
clear all

nrows = 10;
ncolumns = 10;
Tsup = 200;
Hsup = 2;
Tinf = 180;
Hinf = 2;
nodes = nrows*ncolumns;
itr = 10^4;
k = 250;

for i = 1:1:nrows
    T(i,1) = 0; O(i,1) = T(i,1);
    T(i,nrows) = 1700; O(i,nrows) = T(i,nrows);
end

for i = 1:1:nrows
    T(i,1) = 1850; O(i,1) = T(i,1);
    T(i,1) = 1850; O(i,nrows) = T(i,nrows);
end

for z = 2:ncolumns-1
  T(ncolumns,z) = (2*(T(1+1,z) + T(1,z+1) + T(1,z-1) + (2*Hinf*nodes*Tinf)/k)/(4+(2*Hinf*nodes)/k));
end

for z = 2:ncolumns-1
  T(1,z) = (2*(T(1+1,z) + T(1,z+1) + T(1,z-1) + (2*Hsup*nodes*Tsup)/k)/(4+(2*Hsup*nodes)/k));
end

T(1,1) = [T(1,2)+T(2,1)]/2;
T(nrows,1) =[T(nrows-1,1)+T(ncolumns,2)]/2;
T(1,ncolumns) = [T(1,ncolumns-1)+T(2,ncolumns)]/2;
T(nrows,ncolumns) = [T(nrows,ncolumns-1)+T(nrows-1,ncolumns)]/2;

for k = 2:1:nrows-1
    for l = 2:1:ncolumns - 1
        T(k,l) = 27;
        I(k,l) = T(l,k);
    end
end

display(T)

for x = 1:1:itr
    for y = 2:1:nrows-1
       for z = 2:1:ncolumns-1
           T(y,z) = [T(y+1,z)+ T(y-1,y)+ T(y,z+1)+ T(y,z-1)]/4;
       end
    end
end
display(T)

figure(1)
contourf(T,'ShowText','on')
title('Distribuição')
legend('ºC')