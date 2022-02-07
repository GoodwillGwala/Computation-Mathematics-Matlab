clc
clear all
n = 6;
s = 1e-10;
x_approx = hilbert(n)
x = ones(n);

for i=2 : n
    x = ones(i);
    x_approx = hilbert(i);
      for j =1 : i
        delta_x(j) = abs(x_approx(j) -x(j));
      end 
    norm = max(delta_x)
    
end


A = [2 1 -1 2;
     4 5 -3 6;
     -2 5 -2 6;
     4 11 -4 8];
 
b = [ 5 9 4 2];

[relError,xstar, xtrue] = gaussEliminationAd(A,b)

A =  [3 -1 1;
      3 6 2;
      3 3 7]
  
b = [ 1 0 4].'
x_0 = [0 0 0].'
tol = [1e-1 1e-2 1e-3] ; 

[results, iterationCount] = jacobiTolComp(A, b, x_0, tol)