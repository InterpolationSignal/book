function v=Vandermond(t)
% �������, ������������ 
% v - �������� ��������� ������� �����������
%
% ������� ����������:
% t - �������� ����� ��������� �����

N=length(t);
v=ones(N,N);
for i=1:N
  for j=1:N
    v(i,j)=t(i).^(N-j);
  end
end
