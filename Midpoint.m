function [x,y] = Midpoint(f,x0,y0,N,xf)
    
       % calculate step 
        h = abs(xf-x0)/N;

        %  x  vector
        x = (x0:h:xf)';

        % y  vector
        y = zeros(N+1,1);
        
        % initial values
        y(1) = y0;
        x(1) = x0;
        
        
          % x1 to xf
        for i=2:N+1
            temp_x = x(i-1)+(h/2);
            temp_y = y(i-1)+(h/2)*f(x(i-1),y(i-1));
            y(i)  = y(i-1)+h*f(temp_x,temp_y); 
        end % for
        
    
    
end % function

