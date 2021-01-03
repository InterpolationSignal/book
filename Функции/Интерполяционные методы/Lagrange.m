function z=Lagrange(tk,xk,t)
% �������, ������������
% z � ������, c��������� 
%     �������� �����������������
%     ���������� ��������
% ������� ����������:
% tk � ������, ���������� �������� ����� ������������
% xk � ������, ���������� �������� ����� ������������
% t � ������, ���������� ���������� ��������������� �������� 

N=length(tk);
z=zeros(size(t));
for k=1:N
    d=ones(size(t));
    for n=[1:k-1,k+1:N]
        d=d.*(t-tk(n))/(tk(k)-tk(n));
    end
        z=z+xk(k)*d;
end
