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

>> z=local2_interp(tk,xk,t);

% 4. ���������� �������� ����� ������� � ������������������ ���������� �������   (���. 4.4)

>> figure, plot(t,abs(y-z))

% 5. ������ �������� �������������� ������������ �������

>> N2=length(y);
>> sigPower=sum((y(:).^2)/N2); % �������� ������� ��
>> errorPower1=sum(((y-z).^2)/N2); % �������� ���������� 
                                   % ������������
>> SER=10*log10(sigPower/errorPower1) 
