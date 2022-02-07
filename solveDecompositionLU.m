% Author:   Goodwill Gwala
% Date:     17/02/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:  Function that solves the LU Decompisition of given Matrix       %
%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function x = LUDecomposition(A, b)


    [n_row, n_column] = size(A);
    [m_row, m_col] = size(b);

    % Transpose matrix b if m_col == n_row and save size.
    if m_row~=n_row && m_col==n_row
       b = b.';
      [m_row, m_col] = size(b);
    end % m_row~=n_row

    x = zeros(n_row,m_col);
    detA = findDeterminant(A);
    if detA~=0
      if n_row~=n_column
        disp('A is not a square matrix. Function: LUDecomposition');
      else % n_row~=n_column

        if m_row==n_row

          number_of_swaps = 0;
          [L, U, P, number_of_swaps, track_changes] = decompositionLU(A);
          % copy L matrix
          L_temp = L;

          for i=1:n_row
            m_col = track_changes(i);
            if m_col~=0
              L_temp([m_col m_col+1], :) = L([m_col+1 m_col], :);
            end % if
          end %for

          % permutate matrix b
          b = P*b;

          % solve Ly=Pb using forward substitution:
          y = forwardSubstitution(L_temp,b);

          % solve Ux=y using back substitution
          x = backSubstitution(U,y);
        end %  m_row==n_row
      end % n_row~=n_column


end % solveLUDecomposition
