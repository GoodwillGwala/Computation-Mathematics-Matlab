function [x,y] = rk4(f,x0,y0,N,xf)

       % calculate step
        h = abs(xf-x0)/N;

        %  x  vector
        x = (x0:h:xf)';

        % y  vector
        y = zeros(N+1,1);
        
        %  initial values
        y(1) = y0;
        
        % x1 to xf
        for i=2:N+1
            
            k1 = h*f(x(i-1), y(i-1));
            k2 = h*f(x(i-1)+(h/2), y(i-1)+(k1/2));
            k3 = h*f(x(i-1)+(h/2), y(i-1)+(k2/2));
            k4 = h*f(x(i-1)+h, y(i-1)+k3);
            
            y(i) = y(i-1)+(1/6)*(k1+2*k2+2*k3+k4);
        end % for
        
    
end % function
