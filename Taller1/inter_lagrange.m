function p = inter_lagrange(x,y,xx)
    n = length(x);
    p = 0;
    for i = 1:n
        L = 1;
        for j = 1:n
            if j ~= i
                L = L * (xx - x(j)) / (x(i) - x(j));
            end
        end
        p = p + y(i) * L;
    end
end

