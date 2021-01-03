function z=Steffens_interp(tp,xp,t)
% �������, ������������
% z � �������� ����������������� ��������, 
% ����������� � ������������
% � �������� ������
%
% ������� ����������:
% tp - ������, ���������� 
%      ���������� ����� ������������
% xp - ������, ���������� �������� �� 
% t � ������, ���������� ���������� ����� ��,
%     � ������� ����������� ��������
%     ������������ �������

N=length(tp); % ����� ����� ������������
T=tp(2)-tp(1); % ������ �������������
% ���������� ������ 
% ����������� ����� 
% ��������� ������������
if N/2==round(N/2) 
    N0=N/2;
elseif N/2~=round(N/2)
    N0=round(N/2);
end
% ���������� ���������� � 
% �������� ������� 
% � ����������� �����
t0=tp(N0);
y0=xp(N0);
% ���������� �������� ���������� q
q=zeros(1,length(t));
for k=1:length(t)
   q(k)=(t(k)-t0)/T; 
end
% ���������� ����������� ��������� d
if N/2==round(N/2)
  d=nan(N+1,N+1);
else
  d=nan(N,N);
end
d(1:N,1)=xp;
for n=2:N
    for k=1:N-n+1
       d(k,n)=d(k+1,n-1)-d(k,n-1);
    end
end
% ���������� ���������� 
% ���������������� �������
NN=(N-1)/2;
for m=2:NN
   Q1(:,m)=(q.^2-(m-1)^2);
end
for m=2:NN
   F(m)=factorial(2*m);
end
p=1;
% ��������� �������� 
% ������������ �������
for k=2:NN
    for n=1:length(t)
       z(n,k)=q(n).*prod(Q1(n,2:k))...
       *(q(n)+k)/F(k)*d(N0-p,k*2)-q(n)...
       *prod(Q1(n,2:k)).*(q(n)-k)/F(k)*d(N0-p,2*k);
    end  
p=p+1;
end
z(:,1)=y0+q.*(q+1)/2.*d(N0,2)-q.*(q-1)/2.*d(N0-1,2);
z=sum(z');
