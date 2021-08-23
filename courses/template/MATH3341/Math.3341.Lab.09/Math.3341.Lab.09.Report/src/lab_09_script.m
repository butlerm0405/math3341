% Math 3341, Fall 2021
% Lab 09: Ill-conditioned Matrices and Finite Precision Arithmetic
% Author: Libao Jin
% Date: 10/18/2021

clc; clear; warning off;

%% 1 Ill-Conditioned Systems
disp('=========================================')
disp(' 1 Ill-Conditioned Systems')
disp('=========================================')

% 1(f)
n = [9, 11, 13, 15];          % size of desired matrix

for i = 1:length(n)
    lab_09_function(n(i));
end

%% 2 Finite Precision Arithmetic
disp('=========================================')
disp(' 2 Finite Precision Arithmetic ')
disp('=========================================')

% 2(a)
s = sum(ones(10, 1) * 0.1);
error_1 = abs(s - 1);

% Output for 2(a)
disp('------------------ (a) ------------------')
fprintf('%9s = % .20f \n','s', s)
fprintf('%9s = % .20f \n', '|s-1|', error_1)

% 2(b)
b = 2 - 3 * (4 / 3 - 1);
error_2 = abs(b - 1);

% Output for 2(b)
disp('------------------ (b) ------------------')
fprintf('%9s = % .20f \n','b', b)
fprintf('%9s = % .20f \n', '|b-1|', error_2)

% 2(c)
a = 0.3;
lhs = 0;
for i = 0:5
    lhs = lhs + a ^ i;
end
rhs = (1 - a^6) / (1 - a);
error_3 = abs(lhs-rhs);

% Output for 2(c)
disp('------------------ (c) ------------------')
fprintf('%9s = % .20f \n', 'lhs', lhs)
fprintf('%9s = % .20f \n', 'rhs', rhs)
fprintf('%9s = % .20f \n', '|lhs-rhs|', error_3)

% 2(d)
x = 1e16 + 1 - 1e16;
y = 1e16 - 1e16 + 1;
z = 1e16 - (1e16 - 1);

% Output for 2(d)
disp('------------------ (d) ------------------')
fprintf('%9s = % .20f \n', 'x', x)
fprintf('%9s = % .20f \n', 'y', y)
fprintf('%9s = % .20f \n', 'z', z)

% 2(e)
u = 1 + 0.1 - 1;
v = 1 - 1 + 0.1;
w = 1 - (1 - 0.1);

% Output for 2(e)
disp('------------------ (e) ------------------')
fprintf('%9s = % .20f \n', 'u', u)
fprintf('%9s = % .20f \n',  'v', v)
fprintf('%9s = % .20f \n', ' w', w)
disp('Comparing u,v,w:')
fprintf('%9s = % g \n', 'u-v', u-v)
fprintf('%9s = % g \n', 'v-w', v-w)
fprintf('%9s = % g \n', 'w-u', w-u)
