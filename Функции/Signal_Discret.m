function [t z]=Signal_Discret(A,Fs,Phi,Nperiod,Fdmnless)
% �������, ������������
% t - ������� �������, 
% � ������� ��������� 
% �������� ��, 
% z - ��������������� �������� 
%     ����������� �������
%
% ������� ����������
% A - ��������� �������
% Fs - ������� �������
% Phi - ��������� ���� �������
% Nperiod - ���������� �������� �������, 
% ������������ ��� ������� 
% (����� ���� ������� ������)
% Np - ���������� �������� ��,
% Fdmnless - ������������ ������� �������

Fd=Fs/Fdmnless;  % ���������� ������� �������������; 
Td=1/Fd; % ���������� ������� ��
Ts=(1/Fs)*Nperiod; % ������������ �������������� 
                   % ������������ �������

t=0:Td:Ts; % ������� ��, � ����� 
           % ������� ����������� 
           % �������� ��
if t(end)==Ts
t=t(1:length(t)-1);
end;
z=Signal(A,Fs,Phi,t);
