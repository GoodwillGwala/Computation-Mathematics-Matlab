% Author:   Goodwill Gwala
% Date:     5/03/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:  Check for diagonal dominance for iterative methods              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = diagonallyDominant(A);

[n_row, n_col] = size(A);
dominant =1;

for i=1 : n_row
    row = abs(A(n_row,:) );
    d = sum(row) - row(n_col);
    if row(n_col) <= d
      dominant = 0;
    end % row(m) <= d
 end %for

 if dominant ==1
   disp('[A] is diagonally dominant. The solution may converge.');

 else
  disp ('[A] is not diagonally dominant. The solution may not converge.');
end % diagonallyDominant
