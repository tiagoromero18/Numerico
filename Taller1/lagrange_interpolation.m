function y0 = lagrange_interpolation(x, y, x0)
    n = length(x);
    if x0 < x(1) || x0 > x(end)
        error('El valor a estimar está fuera del rango de datos.')
    end
    [~, i] = min(abs(x-x0));
    if i == 2
        x_use = x(1:3);
        y_use = y(1:3);
    elseif i == n-1
        x_use = x(end-2:end);
        y_use = y(end-2:end);
    else
        x_use = x(i-1:i+2);
        y_use = y(i-1:i+2);
    end
    L = 0;
    for j = 1:length(x_use)
        l = 1;
        for m = 1:length(x_use)
            if m ~= j
                l = l * (x0 - x_use(m)) / (x_use(j) - x_use(m));
            end
        end
        L = L + y_use(j) * l;
    end
    y0 = L;
end
