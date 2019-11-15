name=input('enter the input file name\n');
filedata=textread(name,'%f'); 
n=filedata(1);

A=reshape(filedata(2:end),n+1,n);

a=A';
b(1:n)=a(:,n+1);
l=zeros(repmat(n,1));
fileID = fopen ('cholesky_output.txt', 'w');
  fprintf(fileID , 'Cholesky method\n');
for k=1:n-1
    mi=k;
    mj=k;
    for i=k+1:n
        for j=k+1:n
            if abs(a(i,j))>abs(a(k,k))
                mi=i;
                mj=j;
            end
        end
        
    end
    fprintf(fileID , 'Rows interchanged : %f %f \n',k,mi);
    t=a(mi,:);
    a(mi,:)=a(k,:);
    a(k,:)=t(:);
    fprintf(fileID , 'Columns interchanged : %f %f \n',k,mj);    
    t=a(:,mj);
    a(:,mj)=a(:,k);
    a(:,k)=t(:);
end
            
for j=1:n
    t=0;
    for k=1:j-1
        t=t+(l(j,k)*l(j,k));
    end
    l(j,j)=sqrt(a(j,j)-t);
    for i=j+1:n
        t=0;
        for k=1:j-1
            t=t+(l(i,k)*l(j,k));
        end
        l(i,j)=(a(i,j)-t)/l(j,j);
    end
end

z(1)=b(1)/l(1,1);
for i=2:n
    y=0;
    for j=i-1:-1:1
        y=y+(l(i,j)*z(j));
    end
    
    z(i)=(b(i)-y)/l(i,i);
end

u=l';

x(n)=z(n)/u(n,n);
for i=n-1:-1:1
    y=0;
    for j=i+1:n
        y=y+(u(i,j)*x(j));
    end
    
    x(i)=(z(i)-y)/u(i,i);
end
disp(x);
fprintf(fileID, 'L is \n');
  fprintf(fileID,' %f %f %f %f\n', l);
  fprintf(fileID, '\nThe solution is \n');
  fprintf(fileID,' %f %f %f %f\n', x);
  
  fclose(fileID);