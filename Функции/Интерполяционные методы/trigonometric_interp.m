function z = trigonometric_interp(tk,xk,t)
% �������, ������������
% z � �������� ����������������� 
%     ������������������� ��������, 
%     � ������������ � (3.30)
% ������� ����������:
% tk - ������, ���������� ���������� �����,
%      � ����� ������� ������ �������� ��
% xk - ������, ���������� ������� ��
% t � ������, ���������� ���������� ����� 
%     � ������� ����������� ��������
%     ������������ �������
Omega0=2*pi/(tk(end)+tk(1));
N=length(tk);
if mod(N,2)==1
    M = (N-1)/2; 
else
    M=N/2;
end;
a=zeros(1,M+1);
b=zeros(1,M+1);
n=0:N-1;
for k=0:M
    a(k+1)=2/N*dot(xk,cos(k*2*pi/N*n));
    b(k+1)=2/N*dot(xk,sin(k*2*pi/N*n));
end
z=zeros(1,length(t));
for j=1:length(t)
    s=a(1)/2;
    for k=1:M;
        s=s+a(k+1)*cos(k*Omega0*t(j))+b(k+1)*�
          sin(k*Omega0*t(j));
    end
z(j)=s;
end
