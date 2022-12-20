function dydt = deriv1(y,t)
% Compute the first derivative of input vector y, with respect to t
n = length(y);
h = t(2)-t(1);
    for i = 1:n
        if (i==1)
            % Forward difference
            dydt(i) = (y(i+1)-y(i))/(h);
        elseif (i==n)
            % Backward difference
            dydt(i) = (y(i)-y(i-1))/(h);
        else
            % Central difference
            dydt(i) = (y(i+1)-y(i-1))/(2*h);
        end
    end
end