% Author:   Goodwill Gwala
% Date:     17/02/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:  Function for forward elimination with pivoting                  %
%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [matrix_A matrix_b] = forwardElimination(A, b)

    [n, n] = size(A);

    for i = 1:n-1
      %  Pivot
      if(A(i,i)==0)
         A([i i+1],:) = A([i+1 i],:);
         b([i i+1],:) = b([i+1 i],:);
      end %if

      factor = -A(i+1:n,i)/A(i,i); % elimination factor

      A(i+1:n,:) = A(i+1:n,:)   +factor*A(i,:);
      b(i+1:n,:) = b(i+1:n,:)   +factor*b(i,:);
    end% for

  matrix_A = A;
  matrix_b = b;
end % forwardElimination
