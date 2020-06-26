function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza 
  %valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
  
  %calculez valorile functiei in functie de ramuri si de valorile
  %val1, val2. a si b sunt calculate "de mana" cu limite pentru a fieldnames
  %indeplinita conditia de continuitate
  if x >= 0 && x < val1
    y = 0; 
    return;
  endif  
  
  if x >= val1 && x <= val2
    y = (-1/(val1-val2))*x + (val1/(val1 - val2));
    return;
  endif
  
  if x > val2 && x <= 1
    y = 1;
    return;
  endif  
    
endfunction  
	