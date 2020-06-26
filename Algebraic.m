function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
  %Calculez vectorul L(i) (numarul de linkuri detinut de pagina i)
  for i = 1:N
    for j = 1:N
      if A(i,j) == 1 && i ~= j
        L(i)++;
      endif
    endfor
  endfor 
    
  R = zeros(N); %initializez vectorul R
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
     
  T = eye(N) - d*M; 
 
  T_inv = PR_Inv(T);
  %aplic formula
  R = T_inv*((1 - d)/N)*l;  

endfunction