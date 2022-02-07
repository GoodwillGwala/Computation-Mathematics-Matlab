% Author:   Goodwill Gwala
% Date:     5/03/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details: Jacobi method with an initial vector and tolerance               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             DASHBOARD                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [results, iterationCount] = jacobiTolComp(A, b, x_0, tol)

  [n_row, n_col] = size(A);
  [m_row, m_col] = size(b);
  size_tol = size(tol);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 			                  Error checking	                                  %                                			                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if n_row~=n_col
    disp('[A] is not a square matrix. Function:jacobiMethod');
  end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 			                 Main method  		                                  %                                			                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


  if n_row==m_row

   % L U D Composition from [A]
   [L, U,D] = decompositionLUD(A);

      %find spectrul raduis
      [spectral_radius, ~,~,~] = spectralRaduis(A);

      if spectral_radius<1
        % initial solution vector
          x_sup_i = x_0;
          iterationCount = 1;
          i = 1;
          while (i < size_tol) % next iteration


            y   = b-(L+U)*x_sup_i;
            x_sup_next = forwardSubstitution(D,y);
            % Check for stopping criteria.
            if max((abs(x_sup_next-x_sup_i)/abs(x_sup_next)))<=tol(i)
               i = i+1;
               results(i) = x_sup_i(i);
            else
            iterationCount(i) = iterationCount(i) + 1;
            x_sup_i(i) = x_sup_next(i);
            end % max
         end; % while
        results(i) = x_sup_i(i);
     else
     disp('spectral radius > 1, system cannot converge.Function: jacobiMethod');
        results = [];
        iterationCount = 0;
     end % spectral_radius
    end % n_row==m_row
 end % jacobiMethod
