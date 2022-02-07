% Author:   Goodwill Gwala
% Date:     5/03/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details: Spectral Raduis and optimal value algorithm for iterative methods%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [spectral_jacobi, spectral_guass,spectral_SOR ,optimal_omega] =spectralRaduis(A);

  [n_row, n_col] = size(A);

  if n_row==n_col

   % L U D Composition from [A]
   [L, U,D] = decompositionLUD(A);

    B_j = -(L+U)/D;
    spectral_jacobi = max(abs(eig(B_j)));
    B_G_S = U/(-(D+L));
    spectral_guass = max(abs(eig(B_G_S)));

    optimal_omega = 2/(1+sqrt(1-(spectral_jacobi^2)));
    B_omega = ((1-optimal_omega)*D-(optimal_omega*U))/(D+(optimal_omega*L));
    spectral_SOR = max(abs(eig(B_omega)));

  else
    disp('spectral radius could not be found');
    spectral_jacobi = 0;
    spectral_guass  = 0;
    spectral_SOR    = 0;
  end % n_row==n_col
end % spectral_raduis
