function [ y2 ] = secondMode( amplitude, ropeDensity,angFreq,fundWave,numberOfHarmonics, dx, timeToExecute, numberOfX )
F2 = 0.13;             
v2 = sqrt(F2/ropeDensity);           
ffund2 =  v2 / fundWave;         
T2 = 1/ffund2;             
f2 = ffund2 * numberOfHarmonics;           
dt2 = 0.2*dx / v2;          
t2 = 0:dt2:timeToExecute*dt2;             
K2 = (v2 * dt2 / dx)^2;        
y2 = zeros(timeToExecute,numberOfX); 
y2(:,end) = 0;  

for ct2 = 1:timeToExecute
   y2(ct2,1) = amplitude .* sin(angFreq .* t2(ct2));  
end

for ct2 = 2 : timeToExecute-1
   for cx2 = 2 : numberOfX-1
     y2(ct2+1,cx2) = 2*y2(ct2,cx2) - y2(ct2-1,cx2) + K2 * (y2(ct2,cx2+1) - 2* y2(ct2,cx2) + y2(ct2,cx2-1));
   end
end

end

