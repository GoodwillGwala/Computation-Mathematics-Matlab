% Author: Goodwill Gwala
% Date: 15/03/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details: Bisection Method %
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [root] = bisectionSearch(f, tol, I_0)
c_current = 0;
c_previous = 0;
iterations = 0;
a = I_0(1);
b = I_0(2);
root = 0;
error = 0;
c_current = (a+b)/2;
while (1)
    if c_current == 0;
        root = 'Division by zero';
        break;
    end;

    iterations=iterations+1;
    c_current = (a+b)/2; % compute new c

    if f(c_current)*f(a) > 0
        a = c_current;
    else
    b = c_current;
    end% f(c_current)*f(a)

    %stopping criteria
    error(iterations)= abs(c_current-c_previous)/abs(c_current);
    if error(iterations)<tol
        root = c_current;
        break;
    end% error(n)<tol
    c_previous = c_current;
end % while
%Plot
% plot(1:iterations, error);
% axis([1 iterations 0 1]);
end % bisectionSearch
