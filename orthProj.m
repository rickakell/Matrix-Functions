##orthProj is a function to find the orthogonal projection of X onto A
##input matrix A and vector X
##output orthogonal projection of X onto A
function T = orthProj(A, X)
  r = rows(A);
  #row reduced version of matrix to remove dependent columns
  T = rref(A);
  #columns of zeros
  zer = find(all(A==0));
  #create new matrix without dependent columns
  new = columns(A) - length(zer);
  B = zeros(r, new);
  counter = 1;
  #loop through all columns
  for i = 1:columns(A)
    #only add if not a dependent column
    if(~ismember(i, zer))
      B(1:r, counter) = A(1:r, i);
      counter += 1;
    endif
  endfor
  ##Formula for orthogonal projection A (A*A)^-1 A*
  T = B * inverse(ctranspose(B)*B) * ctranspose(B) * X;
  return
endfunction