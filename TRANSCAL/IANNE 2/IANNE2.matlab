clc
clear all

%% Variáveis
comprimento = 10;
largura = 10;
pontos = comprimento*largura;
TS = 550;
HS = 2;
TI = 550;
HI = 2;
iteracoes = 10^4;
k = 230;

for i = 1:1:comprimento
    T(i,1) = 0; O(i,1) = T(i,1);
    T(i,comprimento) = 750; O(i,comprimento) = T(i,comprimento);
end

for i = 1:1:comprimento
    T(i,1) = 760; O(i,1) = T(i,1);
    T(i,1) = 760; O(i,comprimento) = T(i,comprimento);
end

for z = 2:largura-1
  T(largura,z) = (2*(T(1+1,z) + T(1,z+1) + T(1,z-1) + (2*HI*pontos*TI)/k)/(4+(2*HI*pontos)/k));
end

for z = 2:largura-1
  T(1,z) = (2*(T(1+1,z) + T(1,z+1) + T(1,z-1) + (2*HS*pontos*TS)/k)/(4+(2*HS*pontos)/k));
end

T(1,1) = [T(1,2)+T(2,1)]/2;
T(comprimento,1) =[T(comprimento-1,1)+T(largura,2)]/2;
T(1,largura) = [T(1,largura-1)+T(2,largura)]/2;
T(comprimento,largura) = [T(comprimento,largura-1)+T(comprimento-1,largura)]/2;

for k = 2:1:comprimento-1
    for l = 2:1:largura - 1
        T(k,l) = 27;
        I(k,l) = T(l,k);
    end
end

for x = 1:1:iteracoes
    for y = 2:1:comprimento-1
       for z = 2:1:largura-1
           T(y,z) = [T(y+1,z)+ T(y-1,y)+ T(y,z+1)+ T(y,z-1)]/4;
       end
    end
end

figure(1)
contourf(T,'ShowText','on')
title('Temperaturas (ºC)')