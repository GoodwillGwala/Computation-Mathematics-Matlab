% Author:   Goodwill Gwala
% Date:     5/03/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:  LU Decomposition for iterative methods.                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [L, U,D] = decompositionLUD(A)

    [n_row, n_col] = size(A);
    % get Diagonal of A
    D = diag(diag(A));
    L = zeros(n_col, n_row);
    U=L;
    % Separate into L and U:
    for i = 1:n_row
      L(i,1:i-1)=A(i,1:i-1);
      U(i,i+1:n_row)=A(i,i+1:n_row);
    end % for
end % decompositionLU
