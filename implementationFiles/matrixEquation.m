#matrixEquation outputs the solution to the equation Ax = b
#given the inputs of a square matrix A and a vector b
#outputs to the console each result x of the solution vector in order
function matrixEquation (A, b)
  r = rows(A);
  c = columns(A);
  #Augment and row reduce A and b
  C = rref([A b]);
  #loop through to look for free varibles
  consistent = true;
  for i = 1:r
    free = true;
    #loop through row
    for j = 1:c
      #at least 1 entry is nonzero
      if(C(i,j) != 0)
        free = false;
      endif
      if(j == c)
        #all but the last entry are 0
        if(free && C(i,j+1) != 0)
          disp("The system is inconsistent")
          return
        endif
      endif
    endfor
    #At least 1 entry other than the last was nonzero
    if(free)
      x = ["x", num2str(i), " is free"];
      disp(x)
    else
      x = ["x", num2str(i), " = ", num2str(C(i,c+1))];
      disp(x)
    endif
  endfor
endfunction
