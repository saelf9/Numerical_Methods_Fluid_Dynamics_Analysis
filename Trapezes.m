function [I] = Trapezes(fa, fb, a, b)
    I = (fa + fb) * (b - a) / 2; % Trapezoidal rule approximation
end