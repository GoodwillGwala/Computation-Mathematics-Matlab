% Author:   Goodwill Gwala
% Date:     17/02/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:  Function that finds a determinant of any matrix using           %
% decomposition                                                             %
%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function det_A = findDeterminant(A)

    [n_row, n_col] = size(A);
    if n_row==n_col
      [L, U, P, number_of_swaps] = decompositionLU(A);

      det_L = 1; % Doo-Little Method
      det_U = 1;
      det_P = 1;

      for i=1:n_row
        det_U = det_U*U(i,i);
      end

      det_P = (-1)^number_of_swaps; % Determinant formula for Permuation Matrix
      det_A = det_L*det_U*det_P;

    else
      disp('A is not a square matrix');

  end %n_row==n_col
end % findDeterminant(A)
