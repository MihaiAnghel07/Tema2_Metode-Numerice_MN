function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  
  v = textread(nume,"%f");
  N = v(1);
  n = length(v);
  val1 = v(n-1);
  val2 = v(n);
  
  %apelez functiile create anterior si afisez rezultatelein nume.out
  
  nume2 = strcat(nume,".out");
  fid = fopen(nume2,'w');
  fprintf(fid,"%f\n\n",N);
 
  PR = Iterative(nume, d ,eps);
  R1 = PR;
  fprintf(fid,"%f\n",PR);
  fprintf(fid,"\n");
  
  PR = Algebraic(nume, d ,eps);
  R2 = PR;
  fprintf(fid,"%f\n",PR);
  fprintf(fid,"\n");
  
  PR1 = sort(PR,'descend');
  %calculez clasamentul
  for i = 1:N
    for j = 1:N
      if PR(i) == PR1(j)
        M(j,2) = i;
        break;
      endif
    endfor
  endfor  
  
  M(:,1) = 1:N;
  
  %calculez a treia coloana a matricei, adica gradul de apartenenta la 
  %multimea paginilor imporante
  
  for i = 1:N
    M(i,3) = Apartenenta(PR1(i), val1, val2);
  endfor
  
 
  for i = 1:N 
    fprintf(fid,"%f ",M(i,:));
    fprintf(fid,"\n");
  endfor
  
 fclose(fid);
  
  endfunction