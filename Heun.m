function [x,y] = Heun(f,x0,y0,N,xf)
    
    % calculate step
    h = abs(xf-x0)/N;
    
    %  x  vector
    x = (x0:h:xf)';
    
    %  y  vector:
    y = zeros(N+1,1);
    y(1) = y0;
    
    % x1 to xf
    for i=2:N+1
      
	% equation 
	%y(i) = y(i-1) + (h/2) [f( x(i-1) , y(i-1) ) + f(x(i),y(i) + hf(x_i,y_n ) ) ]   

	%y(i) = y_(i-1) + h/2[temp1 + temp2]
	% Where temp1 = f(x(i-1),y(i-1));
	% Where temp2 = f( x(i-1) + h , Euler)
	   

		
	Euler = y(i-1) + h*f(x(i-1),y(i-1));        
	
	X_current = x(i-1) + h;

        temp1 = f(x(i-1),y(i-1));
        
	temp2 = f(X_current,Euler);

        y(i)  = y(i-1) + (h/2)*(temp1+temp2);
	  
    end % for
end

