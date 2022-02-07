% Author: Goodwill Gwala
% Date: 15/03/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:Regular falsi method %
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [root] = regularFalsiSearch(f, tol, I_0)
c_current = 0;
c_previous = 0;
iterations=0;
a = I_0(1);
b = I_0(2);
while (1)
    if f(b) == f(a)
        root = 'Cannot find the root. Cannot divide by zero';
    break;
    end% f(b) == f(a)

    iterations = iterations+1;
    c_current = double( ((a*f(b))-(b*f(a)))/(f(b)-f(a)) );
    if ( f(c_current) * f(a) ) > 0
        a = c_current;
    else
    b = c_current;
    end % f(c_current) * f(a)

    error(iterations)=abs(c_current-c_previous)/abs(c_current);
    if (error(iterations))<tol
        root = c_current;
    break;
    end
    c_previous = c_current;
end % while
% axis([1 iterations 0 1]);
% plot(1:1:iterations, error);
end % regularFalsiSearch
