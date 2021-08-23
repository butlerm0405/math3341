% Math 3341, Fall 2021
% Lab 09: Ill-conditioned Matrices and Finite Precision Arithmetic
% Author: first_name last_name
% Date: 10/18/2021

clc; clear; warning off;

%% 1 Ill-Conditioned Systems
disp('=========================================')
disp(' 1 Ill-Conditioned Systems')
disp('=========================================')

% 1(g)

%% 2 Finite Precision Arithmetic
disp('=========================================')
disp(' 2 Finite Precision Arithmetic ')
disp('=========================================')

% 2(a)

% Output for 2(a)
disp('------------------ (a) ------------------')
fprintf('%9s = % .20f \n','s', s)
fprintf('%9s = % .20f \n', '|s - 1|', error_1)

% 2(b)

% Output for 2(b)
disp('------------------ (b) ------------------')
fprintf('%9s = % .20f \n','b', b)
fprintf('%9s = % .20f \n', '|b - 1|', error_2)

% 2(c)

% Output for 2(c)
disp('------------------ (c) ------------------')
fprintf('%9s = % .20f \n', 'lhs', lhs)
fprintf('%9s = % .20f \n', 'rhs', rhs)
fprintf('%9s = % .20f \n', '|lhs-rhs|', error_3)

% 2(d)

% Output for 2(d)
disp('------------------ (d) ------------------')
fprintf('%9s = % .20f \n', 'x', x)
fprintf('%9s = % .20f \n', 'y', y)
fprintf('%9s = % .20f \n', 'z', z)

% 2(e)

% Output for 2(e)
disp('------------------ (e) ------------------')
fprintf('%9s = % .20f \n', 'u', u)
fprintf('%9s = % .20f \n',  'v', v)
fprintf('%9s = % .20f \n', ' w', w)
disp('Comparing u,v,w:')
fprintf('%9s = % g \n', 'u - v', u - v)
fprintf('%9s = % g \n', 'v - w', v - w)
fprintf('%9s = % g \n', 'w - u', w - u)
