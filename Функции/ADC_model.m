function z=ADC_model(Ymin,Ymax,N,y)
% �������, ������������ 
% �������� ��������� �������
%
% ������� ����������
% [Ymin, Ymax] - ������������ �������� ���
% N - ����������� ���
% y - ������, ���������� �������� ����������� �������
 
dy=(Ymax-Ymin)/2^N; % �������� �������� ���
% ������������� ������� �� ���������
z=round((y-Ymin)/dy);
