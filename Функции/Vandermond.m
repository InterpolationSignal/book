function v=Vandermond(t)
% функция, возвращающая 
% v - значения элементов матрицы Вандермонда
%
% Входные переменные:
% t - значения узлов временной сетки

N=length(t);
v=ones(N,N);
for i=1:N
  for j=1:N
    v(i,j)=t(i).^(N-j);
  end
end
