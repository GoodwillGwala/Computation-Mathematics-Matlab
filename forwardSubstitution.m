% Author:   Goodwill Gwala
% Date:     17/02/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:  Function for forward substitution                               %
%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function forward_substitution_y = forwardSubstitution(A,b)

     [n, n] = size(A);
     size_b = size(b);

     number_of_systems = size_b(2);

     y_values = zeros(n, number_of_systems);
     % Substitute from top
     y_values(1,:) = b(1,:)/A(1,1);
     row =1;
     for i=2:n
       sum = 0; %sum of (bx + cx)
       sum = sum+A(i,row:i-1)*y_values(row:i-1,:);
       y_values(i,:) = (b(i,:)-sum)/A(i,i);
     end % for

  forward_substitution_y = y_values;

end %forward_substitution_y
