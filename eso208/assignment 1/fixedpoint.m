function fixedpoint(g,x1)
merror=input('Maximum relative approximate error you want for the method: ');
miter=input('Maximum iterations you want for the method: ');
ix1=x1;
xm=g(x1);

iter=1;
error(1)=100;
while iter < miter & error(iter)>merror
    iter=iter+1;
    x1=xm;
    xm=g(x1);
    error(iter)=abs((xm-x1)/x1)*100;
end
disp(xm);
if(iter>=miter)
      disp('Function terminated due to flag 3 :');
      disp(iter);
  else
      disp('Function terminated due to flag 1:');
      disp(error(iter));
end
iterations = 1:1:iter;
figure;
plot(iterations, error)
  xlabel('Number of iterations');
  ylabel('Relative approximate error');
  
  
xrange = (ix1-(xm-ix1)):0.1:(xm+(xm-ix1));
figure;
for val=1:1:size(xrange,2)
    y(val) = g(xrange(val));
end
plot(xrange,y,xrange,xrange)
    xlabel('x');
    ylabel('g(x)');