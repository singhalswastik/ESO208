function secant(f,x0,x1)
merror=input('Maximum relative approximate error you want for the method: ');
miter=input('Maximum iterations you want for the method: ');
mvalue=input('Minimum closeness of f(x) to zero: ');
ix1=x0;
f1=(f(x1)-f(x0))/(x1-x0);
xm=x1-(f(x1)/f1);
ym=f(xm);
iter=1;
error(1)=abs((x1-x0)/x0)*100;
while (abs(ym) > abs(mvalue)) & iter < miter & error(iter)>merror
    iter=iter+1;
    x1=xm;
    f1=(f(x1)-f(x0))/(x1-x0);
    xm=x1-(f(x1)/f1);
    ym=f(xm);
    error(iter)=abs((xm-x1)/x1)*100;
end
disp(xm);
if(iter>=miter)
      disp('Function terminated due to flag 3 :');
      disp(iter);
  elseif(abs(ym) <= abs(mvalue))
      disp('Function terminated due to flag 2:');
      disp(ym);
  else
      disp('Function terminated due to flag 1:');
      disp(error(iter));
end
iterations = 1:iter;
figure;
plot(iterations, error)
  xlabel('Number of iterations');
  ylabel('Relative approximate error');

  
xrange = (ix1-(xm-ix1)):0.1:(xm+(xm-ix1));
figure;
for val=1:1:size(xrange,2)
    y(val) = f(xrange(val));
end
plot(xrange,y)
    xlabel('x');
    ylabel('f(x)');
