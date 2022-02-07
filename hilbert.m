function x = hilbert(n)
  
  b = zeros(n,1);
  for i=1:n
    for j=1:n
      A(i,j) = 1/(i+j-1);
      b(i,1) = b(i,1) + A(i,j);
    end
   end
   
   x = gaussElimination(A,b);
   
end