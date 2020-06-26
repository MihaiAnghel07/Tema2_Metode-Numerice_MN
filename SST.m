function [x] = SST(A,b)
 
  tol = 0.0001;
  [n m]=size(A);
 
 x=zeros(n,1);
 x0 = zeros(n,1);
 w = 1.2;

  while 1
    
    for i=1:n
      suma=A(i,1:i-1)*x(1:i-1)+A(i,i+1:n)*x0(i+1:n);
      x(i)=w*((b(i)-suma)/A(i,i)) + (1-w)*x(i);
    endfor

    if norm(x-x0)<tol
      return;
    endif
    x0=x;
  endwhile

 endfunction