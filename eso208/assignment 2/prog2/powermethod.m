name=input('enter the input file name\n');
filedata=textread(name,'%f'); 
n=filedata(1);
A=reshape(filedata(2:end-1),n,n);
a=A';
y=zeros(1,n);
y=y';
y(1)=1;
z=a*y;
plambda=y'*z;
merror=filedata(end);
error=100;
while(error>merror)
    mod=0;
    for i=1:n
        mod=mod+z(i)*z(i);
    end
    mod=sqrt(mod);
    y=z/mod;
    z=a*y;
    lambda=y'*z;;
    error=abs((lambda-plambda)/plambda)*100;
    plambda=lambda;
end
disp(lambda);
fileID = fopen ('power_output.txt', 'w');
  fprintf(fileID , 'Power method\n');
  fprintf(fileID, 'Largest Eigen value is \n');
  fprintf(fileID,' %f %f %f %f\n', lambda);
  
  fclose(fileID);