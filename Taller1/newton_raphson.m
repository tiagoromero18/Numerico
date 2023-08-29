function [x0, iter] = newton_raphson(f, df , x0, tol)
    % Inicializar el error
    error = inf;
    
    % Inicializar el contador de iteraciones
    iter = 0;
    % Bucle mientras el error sea mayor que la tolerancia
    while (error > tol)  
        xkm1 = x0 - (f(x0) / df(x0));
        error = abs(xkm1 - x0);
        x0 = xkm1;
        iter = iter + 1;
    end
end


