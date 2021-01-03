% 1. ������ �������� ��������� ������� � ������� ������������ MATLAB

>> [y1, fd] = audioread('Cosma_96000.wav');


% 2. ������������ �������� ������������������ ��������� �������

>> L=4;% ����������� ��������� ��������� �������
>> T2=1/fd; % ������ ������������� ��������� �������
>> N2=840*L; % ����� �������� ��������� �������
>> t=T2*(0:N2-1); % ������� ����� �� ��������� �������
>> y=y1(899-500:N2+898-500)';
>> xk=y(1:L:end); % �������� ������������������ �������
>> tk=t(1:L:end); % ���������� �� ������������������ �������
t(end:-1:end-(L-2))=[];
y(end:-1:end-(L-2))=[];

% 3. ���������� �������� ����������  , SER ��� ������ ������������ ����� ���������-������������

>> z1=Kotelnikov_interp(tk,xk,t); % ������������ ����� ������������ � ����� �������� �� 
>> RMSE= sqrt(sum((y-z1).^2)/length(y));
% ���������� SER
>> N2=length(y);
>> sigPower=sum((y(:).^2)/N2); % �������� �������
>> errorPower=sum(((y-z1).^2)/N2); % �������� ������
>> SER=10*log10(sigPower/errorPower);
