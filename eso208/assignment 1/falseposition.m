function falseposition(f,x1,x2)
merror=input('Maximum relative approximate error you want for the method: ');
miter=input('Maximum iterations you want for the method: ');
mvalue=input('Minimum closeness of f(x) to zero: ');

xrange = (x1-(x2-x1)):0.1:(x2+(x2-x1));
figure;
for val=1:1:size(xrange,2)
    y(val) = f(xrange(val));
end
plot(xrange,y)
    xlabel('x');
    ylabel('f(x)');

xm=x1-((x2-x1)/(f(x2)-f(x1)))*f(x1);
ym=f(xm);
iter=1;
error(1)=100;
pxm=xm;
while (abs(ym) > abs(mvalue)) & iter < miter & error(iter)>merror
    iter=iter+1;
    
    if(f(x1)*ym<0)
        x2=xm;
    else
        x1=xm;
    end
    pxm=xm;
    xm=x1-((x2-x1)/(f(x2)-f(x1)))*f(x1);
    ym=f(xm);
    error(iter)=abs((xm-pxm)/pxm)*100;
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