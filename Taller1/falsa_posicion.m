function [c, iter] = falsa_posicion(f, a, b, tol)
    error = inf;
    iter = 0;

    while error > tol
        c = b - f(b)*(b-a)/(f(b)-f(a));
    
        % Evaluar la función en los puntos a, b y c
        fa = f(a);
        fb = f(b);
        fc = f(c);
    
        % Verificar si hay cambio de signo en [a, c]
        if fa * fc < 0
            % Si hay cambio de signo, actualizar el intervalo a [a, c]
            b = c;
        else
            % Si no hay cambio de signo, actualizar el intervalo a [c, b]
            a = c;
        end
        % Calcular el nuevo error
        error = abs(fc);
        % Incrementar el contador de iteraciones
        iter = iter + 1;
    end
end