function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Folosesc algoritmul Gram-Schmidt pentru a descompune matricea A in Q*R
  %Apoi cu ajutorul matricelor Q si R calculez cele N sisteme de ecuatii
  %de unde rezulta inversa lui A
  
  
  N = size(A);
  Q = zeros(N);
  R = zeros(N);
  %aflu Q si R astfel incat A = Q*R;

   for j = 1 : N
     for i = 1 : j-1
        R(i,j) = Q(:,i)' * A(:,j);
     endfor
    s = zeros(N,1);
     for i = 1 : j-1
       s = s + R(i,j) * Q(:,i);
     endfor
    
    aux = A(:,j) - s;

    R(j,j) = norm(aux,2);
    Q(:,j) = aux/R(j,j);
   endfor
 
  Q = Q';
 
 %Se rezolva cele N sisteme de ecuatii cu ajutorul functiei SST
  for i = 1:N
    B(:,i) = SST(R,Q(:,i));
  endfor;
  
  endfunction