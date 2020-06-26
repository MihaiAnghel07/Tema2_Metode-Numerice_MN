function R = Iterative(nume, d, eps)

	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator 
  %sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
 
  v = textread(nume,"%f");
  contor = 1;
  N = v(contor); % Numarul de pagini
  A = zeros(N); %matricea de adiacenta
  contor = 3;
  
  %creez matricea de adiacenta 
  for i = 1:N
    n = v(contor);
    contor++;
    for j = 1:n
        A(i,v(contor)) = 1;
        contor++;
    endfor
   contor++;
  endfor
  
  for i = 1:N % ma asigur ca elementele de pe diagona sunt nule
    A(i,i) = 0;
  endfor
  
  L(1:N) = 0;
  %Calculez vectorul L(i) (numarul de linkuri detinute de pagina i)
  for i = 1:N
    for j = 1:N
      if A(i,j) == 1 && i ~= j
        L(i)++;
      endif
    endfor
  endfor  
  
  
%initializez matricea R
  R = ones(N); 
  R = (1/N)*R;
  R_init = R;
  contor = 0;
  
  %Calculez matricea stochastica M
  M = A;
  for i = 1:N
    for j = 1:N
      if M(i,j) == 1 && i ~= j
        M(i,j) = M(i,j) / L(i);
      endif
    endfor
  endfor

   %creez elementele necesare formulei
  l(1:N) = 1;
  l = l';
  M = M';
  
  %aplic algoritmul in forma matriceala
  while 1
    R = d*M*R_init + (1 - d)/N*l;
    if norm(R - R_init) < eps
      break
    endif
  R2 = R_init;  
  R_init = R;  
endwhile  
%algoritmul face un pas in plus,de aceea intorc R_init
%si transform matricea intr-un vector coloana
  R = R2;
  R(:,2:N) = [];

endfunction