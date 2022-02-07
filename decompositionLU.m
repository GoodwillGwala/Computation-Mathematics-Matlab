% Author:   Goodwill Gwala
% Date:     17/02/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:  LU Decompisition  with permutation matrix                       %
%                                   			                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [L, U, P, number_of_swaps, track_changes] = decompositionLU(A)

    [n, n] = size(A); % Find size of matrix A

    % Initialize  matrices
    L=eye(n);
    P=L;
    U=A;

    track_changes = zeros(n,1);

    for i = 1:n-1
      % pivot
      if(A(i,i)==0)
         A([i i+1],:) = A([i+1 i],:);  %Swap
         track_changes(i)=i;
      end; %end
      % L matrix construction during elimination
      L(i+1:n, i) = A(i+1:n,i)/A(i,i) ;
      factor = -A(i+1:n,i)/A(i,i); % factor
      A(i+1:n,:) = A(i+1:n,:)+factor*A(i,:);
    end % for

    %track changes
    number_of_swaps=0;
    for i=1:n-1
        if track_changes(i)~=0
          swap = track_changes(i);

          % Swap diagonals of L matrix
          temp = L(swap,swap);
          L(swap,swap)= L(swap+1,swap);
          L(swap+1,swap)= temp;

          temp = L(swap,swap+1);
          L(swap,swap+1) = L(swap+1,swap+1);
          L(swap+1,swap+1) = temp;

          % Swap rows permutation
          temp = P(swap,swap);
          P(swap,swap)= P(swap+1,swap);
          P(swap+1,swap)= temp;

          temp = P(swap,swap+1);
          P(swap,swap+1) = P(swap+1,swap+1);
          P(swap+1,swap+1) = temp;
          number_of_swaps = number_of_swaps+1;
        end % if
    end % for
    U = A;
end % decompositionLU
