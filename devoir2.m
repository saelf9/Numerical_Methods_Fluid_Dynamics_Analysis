% Devoir2.m
% Script file to solve Newton method and swimming pool problem
tic
% Part 1: Newton method to solve 10000 = x e^x
f = @(x) 10000 - x * exp(x);
df = @(x) -exp(x)*(x + 1);
x0 = 7;
tolr = 1e-10;
nmax = 20;


x_vals = Newton(f, df, x0, tolr, nmax);

% Calculate errors for Newton's method
errors = abs(x_vals(2:end) - x_vals(1:end-1)); % Errors between iterations

% Create a new figure for comparing e_n and e_{n+1} in logarithmic scale
figure;
loglog(errors(1:end-1), errors(2:end), 'b-o'); % Log-log plot of e_n vs e_{n+1}
title('Log-Log Comparison of e_n vs e_{n+1} for Newton Method');
xlabel('log(e_n) (Log of Error at iteration n)');
ylabel('log(e_{n+1}) (Log of Error at iteration n+1)');
grid on;

% Part 2: Swimming Pool Jump
% Constants
m = 70; % Mass in kg
A = 0.2; % Area in m^2 (use a reasonable estimation for the human body)
g = 9.81; % Gravitational acceleration
v0 = sqrt(2 * g * 5); % Initial velocity from 5 meters jump
vf = 0; % Final velocity

% Velocity range
num_intervals = 1000001; % Number of intervals for velocity
v = linspace(v0, vf, num_intervals); % Velocity values from v0 to vf = 0
t = zeros(1, num_intervals); % Preallocate time vector
d = zeros(1, num_intervals); % Preallocate distance vector

% Loop for time integration
for i = 2:length(v)
    % Calculate acceleration for v(i-1) and v(i)
    a_v1 = (m * g - (m * g / 0.985) - 0.5 * 650 * A * v(i-1)^2) / m; % Acceleration for previous velocity
    a_v2 = (m * g - (m * g / 0.985) - 0.5 * 650 * A * v(i)^2) / m; % Acceleration for current velocity

    % Approximate time increment using trapezoidal rule
    t(i) = t(i-1) + Trapezes(1/a_v1, 1/a_v2, v(i-1), v(i)); % Time integration
end

% Loop for distance integration
for i = 2:length(t)
    d(i) = d(i-1) + Trapezes(v(i-1), v(i), t(i-1), t(i)); % Distance integration
end

% Plotting Acceleration vs Time
figure
plot(t, arrayfun(@(v) (m * g - (m * g / 0.985) - 0.5 * 650 * A * v^2) / m, v));
title('Acceleration vs Time');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
grid on;

% Plotting Speed vs Time
figure
plot(t, v);
title('Speed vs Time');
xlabel('Time (s)');
ylabel('Speed (m/s)');
grid on;

% Plotting Distance vs Time
figure
plot(t, d);
title('Distance vs Time');
xlabel('Time (s)');
ylabel('Distance (m)');
grid on;

% Display final time and distance
fprintf('Final time: %.4f seconds\n', t(end));
fprintf('Final distance: %.4f meters\n', d(end));
toc