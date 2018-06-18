function [ y3 ] = thirdMode(  amplitude, ropeDensity,angFreq,fundWave,numberOfHarmonics, dx, timeToExecute, numberOfX )
F3 = 0.055;
v3 = sqrt(F3/ropeDensity);           
ffund3 =  v3 / fundWave;         
T3 = 1/ffund3;             
f3 = ffund3 * numberOfHarmonics;           
dt3 = 0.2*dx / v3;          
t3 = 0:dt3:timeToExecute*dt3;             
K3 = (v3 * dt3 / dx)^2;        
y3 = zeros(timeToExecute,numberOfX);      
y3(:,end) = 0;  

for ct3 = 1:timeToExecute
   y3(ct3,1) = amplitude .* sin(angFreq .* t3(ct3));  
end

for ct3 = 2 : timeToExecute-1
   for cx3 = 2 : numberOfX-1
     y3(ct3+1,cx3) = 2*y3(ct3,cx3) - y3(ct3-1,cx3) + K3 * (y3(ct3,cx3+1) - 2* y3(ct3,cx3) + y3(ct3,cx3-1));
   end
end
end

