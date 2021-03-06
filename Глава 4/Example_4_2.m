% 1.	������� ��������� �������� ��������������� �������

>> A=1; % ��������� ��
>> Fs=1/(2*pi); % ������� ��, ��
>> Phi=0; % ��������� ���� ������� ��
>> Nperiod=1.1; % ����� �������� �������, 
              % �������������� �� ��������� ������� ��
>> Fdmnless=1/8; % ������� ������������ 
                 % ������� ������������� ��
% ���������� �������� �� 
>> [tk xk]=Signal_Discret(A,Fs,Phi,Nperiod,Fdmnless); 

% 2. ������� �������� ������� �����, � ������� ����������� �������� ����������������� ��������

>>  T=Fdmnless/Fs; % ���������� ���������� 
                   % ������� ������������� ��
>>  N=length(tk); % ����� ����� ������������
>>  Np=125; % ������� ������������ ��, 
            % � ����� ������� 
           % ����������� ���������������� � ������  
           % �������� ������������ �������  	 
>>  i=1:Np;                 
>>  t=tk(1)+(tk(N)-tk(1))/(Np-1)*(i-1);           
>>  y=Signal(A,Fs,Phi,t); % ���������� ������ ��������  
                          % ����������� �������

% 3. ���������� ��������������� �������� ������� � ����� �������� ��

>> z=interp1(tk,xk,t,'spline');

% 4. ���������� ��������� �������� ����������� �������, ����������� ���� ������������, ��������� �������, ����������� ������ �������� ������� � �������, ���������������� � ������� �������-�������� � �������-������������  ��������� (���. 4.6)

>> plot(tk,xk,'o',t,y,t,z)


% 5. ���������� � ������������ �������� ������ ����������� ������� (���. 4.7)

>> m=1:N2-1;
>> yk1(m)=(y(m+1)-y(m))/(2*pi/(N2-1));
>> figure('color','w'), plot(t(m),yk1(m))


% 6. ���������� � ������������ �������� ������ ����������� ������� (���. 4.8)

>> m=1:N2-2;
>> yk2(m)=(yk1(m+1)-yk1(m))/(2*pi/(N2-2));
>> figure('color','w'), plot(t(m),yk2(m))

 
% 7. ���������� �������� � ������������ ������� ����������� �������� 

>> m=1:N2-3;
>> yk3(m)=(yk2(m+1)-yk2(m))/(2*pi/(N2-3));
>> figure, plot(t(m),yk3);


% 8. ���������� �������� ����� ������ � ������������������ ���������� �������   (���. 4.10)

>> figure, plot(t,abs(y-z))

% 9. ������ �������� ������ �������������� �� � ���������� ��������� SER

>> N2=length(y);
>> sigPower=sum((y(:).^2)/N2); % �������� ��
>> errorPower=sum(((y-z).^2)/N2); % �������� ����������� 
                                  % ������������
>> SER_15=10*log10(sigPower/errorPower)

