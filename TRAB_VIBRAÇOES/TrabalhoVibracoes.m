% Alunos: Sérgio Santos Ribeiro Júnior e Hanna Thainá Prates Arimatéia

clear all
close all
clc
frequency = 43,4783;         
numberOfX = 100;                  
timeToExecute = 10000;            
numberOfSteps = 50;                
numberOfHarmonics = 1:40;          
numberOfPeriods = 100;             
ropeLenght = 0.485;                
ropeDensity = 0.000286;            
fundWave = 2*ropeLenght;                  
amplitude = 0.040;                  
x = linspace(0,ropeLenght,numberOfX);
dx = x(2)-x(1); 
angFreq = 2*pi*frequency;

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

F2 = 0.13 ;
v2 = sqrt(F2/ropeDensity)
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

F3 = 0.055                  
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

F4 = 0.032                  
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

%figure('units','normalized','outerposition',[0 0 1 1])
set(gcf, 'Position', [100, 10, 500, 650])
ymax = 1.0;

subplot(411)
plot(x,y1(1,:),'linewidth',2);
axis([0 ropeLenght -ymax ymax]);
grid on
title('1° Modo')

subplot(412)
plot(x,y2(1,:),'linewidth',2);
axis([0 ropeLenght -ymax ymax]);
grid on
title('2° Modo')

subplot(413)
plot(x,y3(1,:),'linewidth',2);
axis([0 ropeLenght -ymax ymax]);
grid on;
title('3° Modo')

subplot(414)
plot(x,y4(1,:),'linewidth',2);
axis([0 ropeLenght -ymax ymax]);
grid on
title('4° Modo')

M = getframe(gcf);
[im,map] = rgb2ind(M.cdata,556,'dither');  %RGB
im(1,1,1,1) = 0;

cc = 1;

for ct = 1: numberOfSteps: timeToExecute
    
    subplot(411)
    plot(x,y1(ct,:),'linewidth',2);
    axis([0 ropeLenght -ymax ymax]);
    set(gca,'Ytick',[-1.00 -0.50 0 0.50 1.00]);
    grid on
    title('1° Modo')
    %pause(eps)
    
    subplot(412)
    plot(x,y2(ct,:),'linewidth',2);
    axis([0 ropeLenght -ymax ymax]);
    set(gca,'Ytick',[-1.00 -0.50 0 0.50 1.00]);
    grid on
    title('2° Modo')
    %pause(eps)
    
    subplot(413)
    plot(x,y3(ct,:),'linewidth',2);
    axis([0 ropeLenght -ymax ymax]);
    set(gca,'Ytick',[-1.00 -0.50 0 0.50 1.00]);
    grid on
    title('3° Modo')
    %pause(eps)
    
    subplot(414)
    plot(x,y4(ct,:),'linewidth',2);
    axis([0 ropeLenght -ymax ymax]);
    set(gca,'Ytick',[-1.00 -0.50 0 0.50 1.00]);
    grid on
    title('4° Modo')
    %pause(eps)
    
    M = getframe(gcf) ;
    cc = cc+1;
    im(:,:,1,cc) = rgb2ind(M.cdata,map,'dither');
    
end
