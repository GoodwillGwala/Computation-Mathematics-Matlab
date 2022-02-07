% Author:   Goodwill Gwala
% Date:     17/02/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details:  Back substitution algorithm                                     %
%                                   			                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function x = backSubstitution(A, b)

     [n, n] = size(A);
     sizeB = size(b);

     NumberOfSystems = sizeB(2);

     % make zero matrix for x values:
     x = zeros(n,NumberOfSystems);

     % substitute from the bottom
     x(n,:) = b(n,:)/A(n,n);

   for i=n-1:-1:1
       sum = 0;
       k =i+1;
       sum = sum+A(i,k:n)*x(k:n,:);
       x(i,:) = (b(i,:)-sum)/A(i,i);
   end


  X = x;
end %backSubstitution
