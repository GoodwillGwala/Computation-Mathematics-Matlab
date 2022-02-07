% Author:   Goodwill Gwala
% Date:     17/02/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:  Guassian Elimination Algorithm                                  %
%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function X = gaussElimination(A, b)

    [n_row, n_column] = size(A);
    [m_row, m_column] = size(b);

    % Transpose matrix b if m_column==n_row.
    if m_row~=n_row && m_column==n_row
        b = b.';
        % new sizes:
        [m_row, m_column] = size(b);
    end %m_row~=n_row

      x = zeros(n_row,m_column);

      % check if matrix is square
      if n_row~=n_column
        disp('A is not a square matrix. Function: gaussianElimination.');
      return

  else % n_row==n_column
      detA = findDeterminant(A);
      if detA~=0 && isreal(detA)
        if m_row==n_row
          %call forward Elimination function
          [A, b] = forwardElimination(A, b);
          % call back Substitution function
          X = backSubstitution(A, b);
        end % if m_row==n_row
      else
        disp('System does not have a solution.');
     end % if detA
    end% n_row~=n_column
end % gaussElimination
