function [x0, iter] = punto_fijo(g, x0, tol)
    % Inicializar el error
    error = inf;
    
    % Inicializar el contador de iteraciones
    iter = 0;
    
    % Bucle mientras el error sea mayor que la tolerancia
    while error > tol
        % Calcular el siguiente valor de x
        x1 = g(x0);
        
        % Calcular el nuevo error
        error = abs(x1 - x0);
        
        % Actualizar el valor de x0
        x0 = x1;
        
        % Incrementar el contador de iteraciones
        iter = iter + 1;
    end
end

