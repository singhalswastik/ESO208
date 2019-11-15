h=input('Enter the value of grid size (h): ');
P=menu('Choose the implementation for the small end boundary','2-nd order Backward Difference', '2-nd order Central Difference with Ghost Node');

n=2/h;
for i=1:n
   x=i*h;
   a(i)=-(x+3)/(x+1);
   b(i)=(x+3)/(x+1)^2;
   f(i)=2*(x+1)+3*b(i);
end

M=zeros(n);
b=zeros(n,1);

for i=1:n-1
   if i==1
       M(i,i)=b(i)-2/h^2;
       M(i,i+1)=1/h^2+a(i)/(2*h);
       b(i)=f(i)-(1/h^2-a(i)/(2*h))*5;
   else
       M(i,i-1)=1/h^2-a(i)/(2*h);
       M(i,i)=b(i)-2/h^2;
       M(i,i+1)=1/h^2+a(i)/(2*h);
       b(i)=f(i);
   end
end

if P==1 %2nd order backward difference
    M(n,n-2)=1/h;
    M(n,n-1)=-4/h;
    M(n,n)=3/h;
    b(n)=0;
    T=M\b;    
end

if P==2 %2nd order central difference with ghost node
    M(n,n-1)=2/h^2;
    M(n,n)=b(n)-2/h^2;
    b(n)=f(n);
    %%%%%%%%%%%%%%%%%Thomas Algorithm
    d(1)=M(1,1);
    u(1)=M(1,2);
    for i=2:n-1 %preparing l,d,u
        d(i)=M(i,i);
        l(i-1)=M(i,i-1);
        u(i)=M(i,i+1);
    end
    d(n)=M(n,n);
    l(n-1)=M(n,n-1);
    
    alpha(1) = d(1);
    beta(1) = b(1);
    for i=2:n
        alpha(i)=d(i)-(l(i-1)/alpha(i-1))*u(i-1);
        beta(i)=b(i)-(l(i-1)/alpha(i-1))*beta(i-1);
    end
    T=zeros(1,n);
    T(n)=beta(n)/alpha(n);
    for i=n-1:-1:1
        T(i)=(beta(i)-u(i)*T(i+1))/alpha(i);
    end
    %%%%%%%%%%%%%%%%%
end

%solve for T

%T=M\b;

%%%%%%%%

for i=1:n
   fprintf('T(%d) = %f\n',i,T(i)); 
end

plot(T);
hold on;
scatter(1:n,T);
title('Discretized Temperature');
xlabel('Node number');
ylabel('Temperature');
hold off;