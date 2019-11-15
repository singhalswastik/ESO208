prompt= 'IS THE EQUATION A POLYNOMIAL? Y/N ' ;
x=input(prompt);
if(x=='N' || x=='n')
    prompt='Enter 1 for Bisetion Method \nEnter 2 for False Position Method \nEnter 3 for Fixed Point Method \nEnter 4 for Newton Raphson Method \nEnter 5 for Secant Method \n ';
    m=input(prompt);
switch m
    case 1
        f=input('Enter f(x) ');
        a=input('Enter two starting points ');
        b=input('');
        bisection(f,a,b)
    case 2
        f=input('Enter f(x) ');
        a=input('Enter two starting points ');
        b=input('');
        falseposition(f,a,b)
    case 3
        g=input('Enter g(x) ');
        a=input('Enter one starting point ');
        fixedpoint(g,a)
    case 4
        f=input('Enter f(x) ');
        f1=input('Enter f''(x) ');
        a=input('Enter one starting point ');
        newtonraphson(f,f1,a)
    case 5
        f=input('Enter f(x) ');
        a=input('Enter two starting points ');
        b=input('');
        secant(f,a,b)
    otherwise
        disp('Wrong Choice')
end
else
    n=input('Enter the order of polynomial ');
    prompt='Enter 1 for Muller Method \nEnter 2 for Bairstow Method \n';
    m=input(prompt);
    switch m
        case 1
            muller(n)
        case 2
            bairstow(n)
        otherwise
            disp('Wrong Choice')
    end
end 