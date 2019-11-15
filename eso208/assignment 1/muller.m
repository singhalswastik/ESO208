function muller(degree)
arr=input('Enter the coeff in Decreasing Order in []:');
k0=input('Enter First Guess :');
k1=input('Enter Second Guess :');
k2=input('Enter Third Guess :');
maxits=input('Enter Maximum no.of Iterations :');
errmax=input('Enter the Maximum Relative approximate error in(%) :');
tolmax=input('Enter the tolerance value(how much f(x) is close to zero)');
strEqn=poly2sym(arr);
strVar = 'x';
F = vectorize(inline(strEqn,strVar));
d1 = k1 - k0;
d2 = k2 - k1;
del1 = (F(k1)-F(k0))./d1;
del2 = (F(k2)-F(k1))./d2;
d = (del2-del1)./(d2+d1);
i = 3;
val = [];
err(1)=100;
err(2)=100;
err(3)=100;
tol=100;

 while ((err(i) > errmax) && (i<maxits) && (tol>tolmax))
    
    b = del2+d2.*d;
    D = sqrt(b.^2-4.*F(k2).*d); 
    
    if abs(b - D) < abs(b + D)
        E = b + D;
    else
        E = b - D;
    end
    
    h = -2.*F(k2)./E;
    p = k2 + h;
    
    str = sprintf('%3u:  % 6.6f + %6.6fi % 6.6f + %6.6fi',i,real(p),imag(p),real(F(p)),imag(F(p)));
    
    tol=abs(F(p));
    val = p;
    
    i = i + 1;
    err(i)=abs((p-k2)/k2);
    
    k0 = k1;
    k1 = k2;
    k2 = p;
    d1 = k1 - k0;
    d2 = k2 - k1;
    del1 = (F(k1)-F(k0))./d1;
    del2 = (F(k2)-F(k1))./d2;
    d = (del2-del1)./(d2+d1);
    
end

if isempty(val)
    disp('The procedure was unsuccessful.')    
end

   disp(val);
   if(i>=maxits)
      disp('Program stopped due to flag 3 :');
      disp(i);
  elseif(tol<=tolmax)
      disp('Program stopped due to flag 2:');
      disp(tol);
  else
      disp('Program stopped due to flag 1:');
      disp(err(i));
  end 
  x = val-100:1:val+100;
  plot(x,F(x));
  grid on;xlabel('x');ylabel('F(x)');title('f(x)vs x');
  ax=gca;
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';
  figure;
  i=1:1:i;
  plot(i,err);
  grid on;xlabel('i');ylabel('relative approx error');title('error vs i');
  ax=gca;
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';