function U = backward_euler(f, df, t, u0)
%BACKWARD_EULER: Solve du/dt = f(t, u) with u(t0) = u0 using Backward Euler Method
%
% Syntax: U = backward_euler(f, t, u0)
% Inputs:
%   f     = function handle, the right-hand side of the ODE du/dt = f(t, u)
%   t     = a vector, the time points at which solution to be found. Note: t(1) = a, t(end) = b
%   u0    = a scalar, the initial value of the solution to the ODE
% Outputs:
%   U     = a vector, the solution of ODE corresponds to t, i.e., U(1) = U(t(1)) = u0, and etc.
%
% Author: Libao Jin
% Date: 05/04/2021


n = length(t);
dt = t(2) - t(1);
U = zeros(length(u0), n);
U(:, 1) = u0;
for i = 2:n
    g = @(u) u - u0 - dt * f(t(i), u);
    dg = @(u) 1 - dt * df(t(i), u);
    u = newton(g, dg, u0);
    u0 = u;
    U(:, i) = u;
end

end
