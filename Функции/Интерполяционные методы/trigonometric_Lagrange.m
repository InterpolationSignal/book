function z = trigonometric_Lagrange(tk,xk,t)
% �������, ������������
% z � �������� ����������������� 
%     ������������������� ��������, 
%     � ������������ � (3.35), (3.36)
% ������� ����������:
% tk - ������, ���������� ���������� �����,
%      � ����� ������� ������ �������� ��
% xk - ������, ���������� ������� ��
% t � ������, ���������� ���������� ����� 
%     � ������� ����������� ��������
%     ������������ �������

N=length(tk);  
z=zeros(size(t));
dt=tk(2)-tk(1);
Omega0=2*pi/(tk(end)+dt);
    for k=1:N
        d=ones(size(t));
        for n=[1:k-1,k+1:N]
            d=d.*sin(Omega0/2*(t-tk(n)))/�
                 sin(Omega0/2*(tk(k)-tk(n)));
        end
        if rem(N,2)==1  % N ��������
            z=z+xk(k)*d;
        else            % N ������
            z=z+xk(k)*d.*cos(Omega0/2*(t-tk(k)));
        end
    end
