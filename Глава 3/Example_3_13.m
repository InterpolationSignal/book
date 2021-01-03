% 1. ������� ��������� �������� ��������������� �������

>> A=1; % ��������� ��
>> Fs=1/(2*pi); % ������� �������, ��
>> Phi=0; % ��������� ���� �������
>> Nperiod=1.1; % ����� �������� ��, 
              % �������������� �� ��������� �������
>> Fdmnless=1/8; % ������� ������������ ������� �������������
% ���������� �������� �� 
>> [tk xk]=Signal_Discret(A,Fs,Phi,Nperiod,Fdmnless);

% 2. ������� �������� ������� �����, � ������� ����������� �������� ���������������� �������

>> T=Fdmnless/Fs; % ������ �������������
>> N=length(tk); % ����� ����� ������������
>> Np=125; % ������� ������������ ��, 
           % � ����� ������� �����������
           % ������ � ����������������� 
           % �������� ������������ �������
>> i=1:Np;                 
>> t=tk(1)+(tk(N)-tk(1))/(Np-1)*(i-1);
>> y=Signal(A,Fs,Phi,t); % ���������� ������ �������� ��

% 3. ���������� �������� ������� �� �������� ���������

>> xk2=zeros(1,N+N);
>> xk2(N/2:(1+1/2)*N-1)=xk;
>> tk2=zeros(1,N+N/4);
>> tk2(1:N/2)=tk(1)-(floor(N/2):-1:1)*T;
>> tk2((1+1/2)*N:N+N)=tk(N)+(1:length((1+1/2)*N:N+N))*T;
>> tk2(N/2:(1+1/2)*N-1)=tk;

% 3. ���������� �������� ���� ������������ � ����� �������� ������������ �����

>> z= Kotelnikov_interp(tk2,xk2,t);

% 4. ������������ ��, ������ � ��������������� �������� ������� (���. 3.37)

>> plot(tk,xk,'o',t,y,t,z)

% 5. ������ �������� ������ �������������� �� � ���������� ��������� SER

>> N2=length(y);
>> sigPower=sum((y(:).^2)/N2); % �������� �������
>> errorPower=sum(((y-z).^2)/N2); % �������� ������
>> SER_11=10*log10(sigPower/errorPower)
