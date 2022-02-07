% Author:   Goodwill Gwala
% Date:     17/02/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:  Guassian elimination for multiple system with partial pivoting  %
%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [relError,xstar, xtrue] = gaussEliminationAd(A, b)

    [n_row, n_col] = size(A);
    [m_row, m_col] = size(b);
    % Transpose matrix b if m_col==n_row.
    if m_row~=n_row && m_col==n_row
      b = b.';
      % new sizes:
      [m_row, m_col] = size(b);
    end % if m_row~=n_row

    xstar = zeros(n_row,m_column);

    if n_row~=n_col
      disp('A is not a square matrix. Function: gaussElimination.');
      return;

    else % n_row == n_col
      detA = findDeterminant(A);
      if detA~=0
        if m_row==n_row
          pivot_row = 1;            % track pivot row
          maxValue = abs(A(1, 1));  % track max abs value

          for i=2:n_row
            if maxValue < abs(A(i, 1))
              maxValue = abs(A(i, 1));
              pivot_row = i;
            end % maxValue
          end % for

      if (pivot_row~=1)

         % temporarily store row and swap row with largest absolute value on A and b
         tempA = zeros(1, n_row);
         tempB = zeros(1, m_col);

         tempA = A(1,:);
         tempB = b(1,:);

            % Swap rows in matrix A
            A(1,:) = A(pivot_row, :);
            A(pivot_row,:) = tempA(1,:);

            % Swap rows in matrix B
            b(1,:) = b(pivot_row, :);
            b(pivot_row,:) = tempB(1,:);
      end % pivot_row~=1

           xtrue = A\b;
          % Perform Forward Elimination
          [A, b] = forwardElimination(A,b);
          % Perform Back Substitution:
          xstar = backSubstitution(A, b);

          for i = 1 : m_col

           relError(i) =abs(xtrue(i) - xstar(i))/abs(xtrue(i));
         end

        end % if m_row==n_row
      else
        disp('System does not have a solution.');
      end % if detA
    end %if n_row~=n_col
end % gaussMultipleSystems
