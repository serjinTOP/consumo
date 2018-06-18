function [ y4 ] = fourthMode(amplitude, ropeDensity,angFreq,fundWave,numberOfHarmonics, dx, timeToExecute, numberOfX   )
F4 = 0.032;
v4 = sqrt(F4/ropeDensity);           
ffund4 =  v4 / fundWave;        
T4 = 1/ffund4;             
f4 = ffund4 * numberOfHarmonics;           
dt4 = 0.2*dx / v4;         
t4 = 0:dt4:timeToExecute*dt4;             
K4 = (v4 * dt4 / dx)^2;        
y4 = zeros(timeToExecute,numberOfX);
y4(:,end) = 0;  

for ct4 = 1:timeToExecute
   y4(ct4,1) = amplitude .* sin(angFreq .* t4(ct4));  
end

for ct4 = 2 : timeToExecute-1
   for cx4 = 2 : numberOfX-1
     y4(ct4+1,cx4) = 2*y4(ct4,cx4) - y4(ct4-1,cx4) + K4 * (y4(ct4,cx4+1) - 2* y4(ct4,cx4) + y4(ct4,cx4-1));
   end
end
end

