% 1. ������� ���������� ������� � ��

>> A=1; % ��������� �������
>> Fs=5; % ������� �������
>> Phi=0; % ���� �������
>> Nperiod=1.1; % ����� �������� �������,
                % �������������� �� 
                % ��������� �������
>> k=10:2:38; % ����� �������� ��
>> Np=10^3; % ����� ����� ��, � �������
            % ����������� ����������������� 
            % �������� ������������ �������
>> i=1:Np;

% 2. ���������� �������� ��������� RMSE ��� ��������� ���������� �������� � ������ ������������ �� ���������   (3.75), � �������������� ����������� � 1 � � 2

>> for m=1:length(k)
        Fdmnless=1.0/k(m); % ���������� ������� ������������
                           % ������� �������������
        % ���������� �������� ��
        [tk xk]=Signal_Discret(A,Fs,Phi,Nperiod,Fdmnless); 
        if mod(length(tk),2)==1
           tk(end)=[];
           xk(end)=[];
        end
        N=length(tk); % ���������� �������� �����
                      % ����� ������������
        t=tk(1)+(tk(N)-tk(1))/(Np-1)*(i-1); % ���������� �������
                                           % ��������� ����� ��,
                                           % � ����� ������� 
                                           % ����������� 
                                           % ����������������� 
                                           % �������� 
                                           % ������������ 
                                           % �������
        y=Signal(A,Fs,Phi,t); % ���������� � ����� ������� �� 
                              % �������� �������� 
                              % ������������ �������
        z0=trig_interp_even_Pn3(tk,xk,t); % ����������
                                          % �����������������
                                          % ��������
                                          % ������������
                                          % �������
                                          % � �������
                                          % �������������������
                                          % �������� (3.74)

        [z11 t11]=trig_interp_even_A1(tk,xk,t,1);
                                          % ���������� 
                                          % �����������������
                                          % ��������
                                          % ������������
                                          % ������� � �������
                                          % ��������� �1
                                          % (������������
                                          % ������� ������� ��)
                                          % � �������� �����
                                          % ���������������
                                          % ����� �� �� t11
        y11=Signal(A,Fs,Phi,t11); % ���������� �������� �������� 
                                  % �� � ����� ����� �� t11
        [z12 t12]=trig_interp_even_A1(tk,xk,t,2); 
                                          % ���������� 
                                          % �����������������
                                          % ��������
                                          % ������������
                                          % ������� � �������
                                          % ��������� �1
                                          % (������������
                                          % ���������� �������)
                                          % � �������� ����� 
                                          % ���������������
                                          % ����� �� �� t12
        y12=Signal(A,Fs,Phi,t12); % ���������� �������� �������� 
                                  % �� � ����� ����� �� t12

        [z2 t2]=trig_interp_even_A2(tk,xk,t);
                                          % ���������� 
                                          % �����������������
                                          % ��������
                                          % ������������
                                          % ������� � �������
                                          % ��������� �2
                                          % � �������� ����� 
                                          % ���������������
                                          % ����� �� �� t2
        K(m,1)=length(t);   
        K(m,2)=length(t12);   
        K(m,3)=length(t2); % ����� ����� ����� �� 
        
        % ���������� RMSE 
        Z(m,1)= sqrt(sum((y-z0).^2)/length(y)); 
        Z(m,2)= sqrt(sum((y11-z11).^2)/length(y));
        Z(m,3)= sqrt(sum((y12-z12).^2)/length(y));
        Z(m,4)= sqrt(sum((y-z2).^2)/length(y))
>> end


% 3. ���������� ��������

>> yyaxis left
>> plot(K(:,1),Z(:,1)), hold on
>> plot(K(:,2),Z(:,2)),
>> plot(K(:,2),Z(:,3),'--'), 
>> plot(K(:,3),Z(:,4),'-.'), 
>> yyaxis right
>> xlabel('K_m'), ylabel('RMSE')
