n=input('A. Solve a System of Equation \nB. Perform a LU decomposition \nC. Perform a Matrix Inversion\n');
if n=='A'
    m=input('Is the system is tri-diagonal? Y/N\n ');
    if m=='Y' || m=='y'
        thomas()
    else
        gauss()
    end
end
if n=='B'
    m=input('Is the matrix symmetric and positive definite? Y/N\n');
    if m=='Y' || m=='y'
        cholesky()
    else
        o=input('doolittle or crout?\n');
        if o=='doolittle'
            doolittle()
        else
            crout()
        end
    end    
end
if n=='C'
    inverse();
end
