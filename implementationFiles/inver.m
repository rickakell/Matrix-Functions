##inver is a function to find the inverse of a matrix
##Takes an input square matrix A
##returns the inverse of the matrix A
function B = inver(A)
  ##checks if matrix is square
  if(rows(A) != columns(A))
    disp("You must enter a square matrix")
    return
  endif
  ##checks if determinant is nonzeros
  if(det(A) == 0)
    disp("This matrix is not invertable")
    return
  endif
  r = rows(A);
  ##making the identity matrix
  id(1:r,1:r) = 0;
  for i = 1:r
    id(i,i) = 1;
  endfor
    ##make matrix to hold augmented matrix
    C(1:r,1:r*2) = 0;
    ##Augment A with the identity matrix
    C = [A id];
    C = rref(C);
    B = C(1:r,r+1:r*2);
  return
endfunction
