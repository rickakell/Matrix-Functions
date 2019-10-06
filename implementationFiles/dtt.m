##dtt is a function to find the determinant of a matrix
##input square matrix A
##returns determinant of matrix A
function a = dtt(A)
  ##checks if matrix is square
  if(rows(A) != columns(A))
    disp("You must enter a square matrix")
    return
  endif
  if(rows(A) == 1)
    a = A
    return
  endif
  ##base case 2x2 matrix
  if(rows(A) == 2)
    ##definition of determinant of a 2x2 matrix
    a = (A(1,1) * A(2,2) - A(2,1) * A(1,2));
    return
  ##recursive case -> cofactor expansion down to 2x2
  else
    ##used for cofactor determinant sum
    b = 0;
    r = rows(A);
    for i = 1:r
    ##for indexing the remaining matrix
    counter = 1;
    ##empty matrix to hold slices to create smaller matrix
    ##for determinant within the expansion
    B(1:r-1,1:r-1) = 9;
      for j = 1:r
        if(j != i)
          ##constructs remaining matrix
          B(counter,1:rows(B)) = A(j,2:r);
          counter = counter + 1;
        endif
      endfor
      ##negative or pos coeffecient, coeffecient, remaining determinant
      b = b + ((-1).^(i + 1)) * A(i,1) * dtt(B);
      a = b;
    endfor
  endif
endfunction
