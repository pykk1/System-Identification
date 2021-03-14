function phi = linieMatrice(grad,x1,y1, x, y)
phi0 = 1;
phi1 = [1, x(x1), y(y1)];
phi2 = [1, x(x1), y(y1), x(x1)^2, x(x1)*y(y1), y(y1)^2];
phi3 = [1, x(x1), y(y1), x(x1)^2, x(x1)*y(y1), y(y1)^2, x(x1)^3, x(x1)^2*y(y1), x(x1)*y(y1)^2, y(y1)^3];

if grad <= 3
    switch (grad)
        case 0
            phi = phi0;
        case 1
            phi = phi1;
        case 2
            phi = phi2;
        case 3
            phi = phi3;
    end
else
    phi = phi3;
    for i=4:grad
        k = 0;
        for j = i:-1:0
            phii(k+1) = x(x1)^j*y(y1)^k;
            k = k + 1;
        end
        phi = [phi phii];
    end
end
end
