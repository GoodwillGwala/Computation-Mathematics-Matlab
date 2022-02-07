% Author:   Goodwill Gwala
% Date:     5/03/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:  Euler Method                                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,y] = Euler(f,x0,y0,N,xf)

       % calculate step
        h = abs(xf-x0)/N;

        %  x  vector:
        x = (x0:h:xf)';

        %  y  vector:
        y = zeros(N+1,1);

	% first row is initial condition
        y(1) = y0;

        % x1 to xf
        for i= 2:N+1

            % equation y_(i+1)= y_i + h*f(x_i,y_i):
            y(i) = y(i-1) + h*f(x(i-1),y(i-1));
        end % for

end% function
