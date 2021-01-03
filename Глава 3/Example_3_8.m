% 1. Задание значений функции в виде последовательности прямоугольных импульсов

>> Fc=2; % частота АС
>> Nperiod=2.5; % число периодов АС, 
                % укладывающихся на интервале анализа
>> Ts=Nperiod/Fc; % длительность анализируемого АС
>> F_dmnless=1/51; % безразмерная частота дискретизации
>> T=F_dmnless/Fc; % период дискретизации
>> tk=0:T:Ts-T; % задание временной сетки
>> N=length(tk);
% вычисление значений ДС в узлах ВС tk
>> tk1=(0:(N-1)/2)*T; 
>> phi1=0;
>> tk2=((N-1)/2+1:N-1)*T;  phi2=-pi/2;
>> xk=[0.5*sin(2*pi*Fc*tk1+phi1) 0.5*…
      sin(2*pi*Fc*(tk2-(N-1)/2*T)+phi2)];
>> w0 = 2*pi/Ts;
>> t=linspace(0,tk(end),5000);

% 2. Вычисление комплексных коэффициентов ряда Фурье 

>> c0 = 0; 
>> M = 63; 
>> tk1=linspace(0,pi,length(tk1));
>> tk2=linspace(pi,2*pi,length(tk2));
>> Fc=0.5/Ts;
>> for m=1:length(M)
   x = c0*ones(1,length(t)); 
    for n=1:M(m),      cn=1/(2*pi)*(trapz(tk1,0.5*sin(2*pi*Fc*tk1).*exp(-1i*n*tk1))+trapz(tk2,0.5*sin(2*pi*Fc*tk1(2:end)-pi/2).*exp(-1i*n*tk2)));
        c_n = conj(cn); 
        x = x + cn*exp(1i*n*w0*t) + c_n*exp(-1i*n*w0*t); 
    end
   z1(m,:)=x;
   end


% 3. Вычисление значений интерполяционного тригонометрического полинома 

>> z2=trigonometric_interp(tk,xk,t);

% 4. Построение временных диаграмм 

>> figure('color','w'),plot(tk,xk,'o',t,z1,t,z2), grid on
>> legend('ДС','Ряд Фурье','Полином')
