name=input('enter the input file name\n');
filedata=textread(name,'%f'); 
n=filedata(1);

A=reshape(filedata(2:end),n+1,n);

a=A';
x=zeros(1,n);
for k=1:n-1
    m=k;
    for j=k+1:n
        if abs(a(j,k))>abs(a(k,k))
            m=j;
        end
    end
    t=a(k,:);
    a(k,:)=a(m,:);
    a(m,:)=t(:);
    for i=k+1:n
        l=a(i,k)/a(k,k);
        for j=k:n+1
            a(i,j)=a(i,j)-(l*a(k,j));
        end
    end
end
x(n)=a(n,n+1)/a(n,n);
for i=n-1:-1:1
    y=0;
    for j=i+1:n
        y=y+(a(i,j)*x(j));
    end
    
    x(i)=(a(i,n+1)-y)/a(i,i);
end
disp(x);
fileID = fopen ('gauss_output.txt', 'w');
  fprintf(fileID , 'Gauss method\n');
  fprintf(fileID, 'The solution is \n');
  fprintf(fileID,' %f %f %f %f\n', x);
  
  fclose(fileID);
    