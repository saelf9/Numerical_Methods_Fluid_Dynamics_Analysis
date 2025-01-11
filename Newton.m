function [x_vals] = Newton(f, df, x0, tolr, nmax)
    x_vals = x0;  % Store the initial guess
    for i = 1:nmax
        x_new = x_vals(end) - f(x_vals(end)) / df(x_vals(end));  % Update x using the last value
        x_vals = [x_vals, x_new];  % Store the new value in the list of results
        if abs(x_new - x_vals(end-1)) < tolr * abs(x_vals(end-1))  % Check convergence
            break;  % Exit if the tolerance is met
        end
    end
end