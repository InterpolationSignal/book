1. ������� �������� �������   � ���� ������������������ ������������� ���������

>> A=1; % ��������� ��������
>> Q=2; % ���������� 
>> tau=pi; % ������������ ��������
>> Tu=Q*tau; % ������ ���������� ���������
>> T=Tu/200; %  ������ �������������
>> tk = 0:T:Tu; % ������ ��
>> xk = A*0.5*impulse(tau,Tu,tk-Tu/4)+0.5;
>> w0 = 2*pi/Tu;
>> t=linspace(0,tk(end),5000);
>> y = A*0.5*impulse(tau,Tu,t-Tu/4)+0.5;


2. ���������� ����������� ������������� ���� ����� 
>>  M = [3 10 100]; % ������� ����� ������ 
                    % ���������� ���� �����
>>  c0 = 0.5; % ������� ���� ����
>>  for m=1:length(M)
    x = c0*ones(1,length(t)); 
    for n=1:M(m), % ���������� �������������
        cn = - 1i*(exp(-i*0.5*pi*n)-�
               exp(-i*3/2*pi*n))/(2*pi*n);
        c_n = conj(cn); 
        x = x + cn*exp(1i*n*w0*t) +�
            c_n*exp(-1i*n*w0*t); 
    end
    z1(m,:)=x;
 end

3. ���������� �������� ����������������� ������������������� �������� 

>> z2=trigonometric_interp(tk,xk,t);

4. ���������� ��������� ��������� ������������������ ������������� ��������� �� ����� ������� � ���������� ���� �����

>> figure('color','w'),
>> plot(t,z1,t,z2)
>> xlim([0 tk(end)])
>> ylim([-0.2 1.2])
>> grid on
>> legend('M=3','M=10','M=100','�������')

 
5. ���������� �������� ����� ������� ���������� �������   � ���������� ���������� ���� ����� (���. 3.23)

>> figure, plot(t,abs(y-z1(end,:)))


6. ���������� �������� ����� ������� ���������� �������   � ���������� ����������������� ������������������� �������� (���. 3.24)

>> figure, plot(t,abs(y-z2))


7. ������ ����������� �����������
>> RMSE_1=std(y-z1(end,:)) % ���������� RMSE 
                           % ���������� ���� �����
>> RMSE_2=std(y-z2) % ���������� RMSE
                    % ������������������� ��������



8. ������ ������������ �������� ���������� ���������� ���� ����� � ����������������� ������������������� �������� �� ������� (3.110)

>> r=find(y==1);
>> E(1,1)=max(z1(1,r)-y(r));
>> E(2,1)=max(z1(2,r)-y(r));
>> E(3,1)=max(z1(3,r)-y(r));
>> E(4,1)=max(z2(r)-y(r));
