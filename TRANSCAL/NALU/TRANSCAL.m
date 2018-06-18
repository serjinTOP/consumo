clc
clear all

linhas = 10;
colunas = 10;
TfluiSup = 50;
HfluiSup = 2;
TfluiInf = 75;
HfluiInf = 2;
numNos = linhas*colunas*10;
iterations = 10^4;
k = 237;

while linhas ~= colunas
    fprintf('A matriz precisa ser quadrada')
return
end

%TEMPERATURA BORDA DIREITA
for i = 1:1:linhas
    T(i,1) = 0; O(i,1) = T(i,1);
    T(i,linhas) = 750; O(i,linhas) = T(i,linhas);
end

%TEMPERATURA BORDA ESQUERDA
for i = 1:1:linhas
    T(i,1) = 760; O(i,1) = T(i,1);
    T(i,1) = 760; O(i,linhas) = T(i,linhas);
end

%FLUIDO SUPERIOR
for z = 2:colunas-1
  T(colunas,z) = (2*(T(1+1,z) + T(1,z+1) + T(1,z-1) + (2*HfluiInf*numNos*TfluiInf)/k)/(4+(2*HfluiInf*numNos)/k));
end

%FLUIDO INFERIOR
for z = 2:colunas-1
  T(1,z) = (2*(T(1+1,z) + T(1,z+1) + T(1,z-1) + (2*HfluiSup*numNos*TfluiSup)/k)/(4+(2*HfluiSup*numNos)/k));
end

%POPULANDO MATRIZ INICIAL
T(1,1) = [T(1,2)+T(2,1)]/2;
T(linhas,1) =[T(linhas-1,1)+T(colunas,2)]/2;
T(1,colunas) = [T(1,colunas-1)+T(2,colunas)]/2;
T(linhas,colunas) = [T(linhas,colunas-1)+T(linhas-1,colunas)]/2;

for k = 2:1:linhas-1
    for l = 2:1:colunas - 1
        T(k,l) = 27;
        I(k,l) = T(l,k);
    end
end

disp('Matriz inicial, antes das iterações')
display(T)

%ITERAÇÕES
for x = 1:1:iterations
    for y = 2:1:linhas-1
       for z = 2:1:colunas-1
           T(y,z) = [T(y+1,z)+ T(y-1,y)+ T(y,z+1)+ T(y,z-1)]/4;
       end
    end
end

disp(['Matriz final após ', num2str(iterations), ' iterações'])
display(T)

%GRÁFICO
figure(1)
contourf(T,'ShowText','on')
title('Distribuição das Temperaturas')
legend('Temperaturas em ºC')
