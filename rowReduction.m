function rowReduction(A)
  r = rows(A);
  c = columns(A);
  for i = 2:(r)
    A(i,:) -= (A(i,1)/A(1,1))*A(1,:);
    A
  endfor
  
endfunction
