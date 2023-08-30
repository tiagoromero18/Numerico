function [xx,yy] = splines_cubicos(X,Y,xx)
n = length(X);
A = zeros(n,n);
b = zeros(n,1);

% Primera fila
A(1,1) = 2;
A(1,2) = 1;
b(1) = 3*(Y(2)-Y(1))/(X(2)-X(1));

% Última fila
A(n,n-1) = 1;
A(n,n) = 2;
b(n) = 3*(Y(n)-Y(n-1))/(X(n)-X(n-1));

% Filas intermedias
for i=2:n-1
    A(i,i-1) = 1;
    A(i,i) = 4;
    A(i,i+1) = 1;
    b(i) = 3*(Y(i+1)-Y(i))/(X(i+1)-X(i)) + 3*(Y(i-1)-Y(i))/(X(i-1)-X(i));
end

% Resolver el sistema de ecuaciones
M = A\b;

% Estimar valores en xx
yy = zeros(size(xx));
for i=1:n-1
    idx = find(xx>=X(i) & xx<=X(i+1));
    t = (xx(idx)-X(i))/(X(i+1)-X(i));
    yy(idx) = (2*t.^3 - 3*t.^2 + 1)*Y(i) + (-2*t.^3 + 3*t.^2)*Y(i+1) + (t.^3 - 2*t.^2 + t)*(X(i+1)-X(i))*M(i) + (t.^3 - t.^2)*(X(i+1)-X(i))*M(i+1);
end
end
