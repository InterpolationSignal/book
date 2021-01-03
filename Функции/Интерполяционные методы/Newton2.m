function z=Newton2(t,x,tk)
% �������, ������������
% z � �������� ����������������� ��������, 
% ������������ � ������������
% �� ������ �������� �������
% ������� ����������:
% t � ������, ���������� ���������� 
%     ����� ��
% x � ������, ���������� 
%     �������� ��
% tk � ������, ����������
%      ���������� �����
%      ������������ ��

N=length(t);
for i=1:N
  f(i,1)=x(i);
end
for k=2:N
  for i=1:N-k+1
    f(i,k)=(f(i+1,k-1)-f(i,k-1))/(t(i+k-1)-t(i));
  end
end
s=x(end);
for k=1:N-1
  r=1;
  for i=0:k-1
    r=r.*(tk-t(N-i)); 
  end;
  s=f(N-k,k+1)*r+s;
end;
z=s;
