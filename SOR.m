% Author:   Goodwill Gwala
% Date:     5/03/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details: SOR  method with an initial vector and tolerance                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             DASHBOARD                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x, iterationCount] = SOR(A, b, x_0, tol)

  [n_row, n_col] = size(A);
  [m_row, m_col] = size(b);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 			                    Error checking            	                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if n_row~=n_col
    disp('[A] is not a square matrix. Function:SOR');
  end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 			                 Main method                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if n_row==m_row
   % L U D Composition from [A]
   [L, U,D] = decompositionLUD(A);

      % calculate spectral raduis and optimal value
    [~, ~,spectral_radius, w_Opt] = spectralRaduis(A);

      if spectral_radius<1
        % initial solution vector
        x_sup_i = x_0;
        iterationCount = 1;
        while (1)

          y = b-(U*x_sup_i);
          x_sup_GS = forwardSubstitution((D+L),y);
          x_sup_next = (1-w_Opt)*x_sup_i+(w_Opt*x_sup_GS);

          % Check for stopping criteria.
          if max((abs(x_sup_next-x_sup_i)/abs(x_sup_next)))<=tol
             break;
          else
          iterationCount = iterationCount + 1;
          x_sup_i = x_sup_next;
          end %max
       end; %while
      x = x_sup_i;
     else
      disp('spectral radius > 1, system cannot converge. Function: SOR');
      x = [];
      iterationCount = 0;
    end % spectral_radius
   end % n_row==m_row
 end % SOR
