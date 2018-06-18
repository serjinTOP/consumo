clc
clear all

%% Variáveis
lenght = 10;
widht = 10;
pts = lenght*widht;
tfs = 30;
hfs = 2;
tfi = 25;
hfi = 2;
numIteracoes = 10^4;
k = 230;

%%Temperatura nas bordas laterais da placa
for i = 1:1:lenght
    T(i,1) = 0; O(i,1) = T(i,1);
    T(i,lenght) = 750; O(i,lenght) = T(i,lenght);
end

for i = 1:1:lenght
    T(i,1) = 760; O(i,1) = T(i,1);
    T(i,1) = 760; O(i,lenght) = T(i,lenght);
end

%%Cálculo temperatura devido aos fluidos na parte superior e inferior da placa
for z = 2:widht-1
  T(widht,z) = (2*(T(1+1,z) + T(1,z+1) + T(1,z-1) + (2*hfi*pts*tfi)/k)/(4+(2*hfi*pts)/k));
end

for z = 2:widht-1
  T(1,z) = (2*(T(1+1,z) + T(1,z+1) + T(1,z-1) + (2*hfs*pts*tfs)/k)/(4+(2*hfs*pts)/k));
end

T(1,1) = [T(1,2)+T(2,1)]/2;
T(lenght,1) =[T(lenght-1,1)+T(widht,2)]/2;
T(1,widht) = [T(1,widht-1)+T(2,widht)]/2;
T(lenght,widht) = [T(lenght,widht-1)+T(lenght-1,widht)]/2;

%%Temperatura padrão interna da placa
for k = 2:1:lenght-1
    for l = 2:1:widht - 1
        T(k,l) = 27;
        I(k,l) = T(l,k);
    end
end

%%Cálculo para a distribuição das temperaturas
for x = 1:1:numIteracoes
    for y = 2:1:lenght-1
       for z = 2:1:widht-1
           T(y,z) = [T(y+1,z)+ T(y-1,y)+ T(y,z+1)+ T(y,z-1)]/4;
       end
    end
end

%%Gerando o gráfico:
figure(1)
contourf(T,'ShowText','on')
title('Temperaturas (ºC)')