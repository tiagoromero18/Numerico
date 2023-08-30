function [p, L] = inter_lagrange(x, y)
% Esta función devuelve el polinomio de interpolación de Lagrange p y los
% polinomios base L para un conjunto dado de puntos (x,y).
% x e y deben ser vectores de la misma longitud.

n = length(x);
L = zeros(n, n);
for j = 1:n
    L(j,:) = poly(x( (1:n) ~= j)); % Multiplicar todos los términos excepto x(j)
    L(j,:) = L(j,:) / polyval(L(j,:), x(j)); % Normalizar para que L(j)(x(j)) = 1
end
p = y * L; % Combinar los polinomios base para obtener el polinomio final
end
