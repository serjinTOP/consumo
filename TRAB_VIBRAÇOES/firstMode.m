function [y1 ] = firstMode(amplitude, ropeDensity,angFreq,fundWave,numberOfHarmonics, dx, timeToExecute, numberOfX )
F1 = 0.47;                   
v1 = sqrt(F1/ropeDensity);          
ffund1 =  v1 / fundWave;         
T1 = 1/ffund1;              
f1 = ffund1 * numberOfHarmonics;           
dt1 = 0.2*dx / v1;          
t1 = 0:dt1:timeToExecute*dt1;             
K1 = (v1 * dt1 / dx)^2;        
y1 = zeros(timeToExecute,numberOfX);          
y1(:,end) = 0;  

for ct1 = 1:timeToExecute
   y1(ct1,1) = amplitude .* sin(angFreq .* t1(ct1));  
end

for ct1 = 2 : timeToExecute-1
   for cx1 = 2 : numberOfX-1
     y1(ct1+1,cx1) = 2*y1(ct1,cx1) - y1(ct1-1,cx1) + K1 * (y1(ct1,cx1+1) - 2* y1(ct1,cx1) + y1(ct1,cx1-1));
   end
end

