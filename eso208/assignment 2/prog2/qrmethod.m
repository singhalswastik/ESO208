name=input('enter the input file name\n');
filedata=textread(name,'%f'); 
n=filedata(1);
A=reshape(filedata(2:end-2),n,n);
a=A';
miter=filedata(end-1);
merror=filedata(end);
  iter = 1;
  value(iter,1) =100;
  value(iter,2) = 1;
  error = 100;
  while (iter<miter && error>merror)
    Q = zeros(n,n);
    for i=1:1:n
      if i==1
        ymod=0;
        for j=1:n
          ymod = ymod + A(j,1)^2;
        end
        ymod = sqrt(ymod);
        Q(:,1) = A(:,1)./ymod;
      else
        Q(:,i) = A(:,i);
        for k = 1:i-1
          Q(:,i) = Q(:,i) - ((A(:,i)')*Q(:,k)).*Q(:,k);
        end
        ymod=0;
        for j=1:1:n
          ymod = ymod + Q(j,i)^2;
        end
        ymod = sqrt(ymod);
        Q(:,i) = Q(:,i)./ymod;
      end
    end
    R = Q'*A;
    B = R*Q;
    curerror=0;
    for i=1:1:n
        curerror = max (curerror,(abs((A(i,i)-B(i,i))/B(i,i))*100));
    end
    A = B;
    error = curerror;
    value(iter,1) = iter;
    value(iter , 2) = error;
    for i=3:1:n+2
      value(iter, i) = A(i-2,i-2);
    end
    iter = iter+1;
  end
  for i=1:n
    eigenvalue(1,i) = A(i,i);
  end
  fprintf('      (Iterations,Error,Eigenvalues) is \n');
  disp(value);
  eigenvalue;
  fileID = fopen ('qr_output.txt', 'w');
  fprintf(fileID , 'QR Method\n');
  fprintf(fileID, '(Error,Eigenvalue) is\n');
  fprintf(fileID,' %f %f %f %f\n', value);
  fprintf(fileID, '\nEigenvalue\n');
  fprintf(fileID ,'%f %f %f\n',eigenvalue);
  fprintf(fileID,'\nIterations\n');
  fprintf(fileID,'%d\n',iter-1);
  
  fclose(fileID);