function [s1,s2] = halton(n,b1,b2)
%input: number of samples n
%       two prime numbers b1 and b2
%output: Halton sequence of n samples inside [0 1]^2 generated by two prime
%        numbers b1, b2
%modified for lab 6 - deleted graph
s1 = zeros(1,n);
s2 = zeros(1,n);
for i = 1:n
    itmp1 = i;
    itmp2 = i;
    f1 = 1/b1;
    f2 = 1/b2;
    while itmp1 > 0;
        q1 = floor(itmp1/b1);
        r1 = mod(itmp1,b1);
        s1(i) = s1(i) + f1*r1;
        itmp1 = q1;
        f1 = f1/b1;
    end

    while itmp2 > 0;
        q2 = floor(itmp2/b2);
        r2 = mod(itmp2,b2);
        s2(i) = s2(i) + f2*r2;
        itmp2 = q2;
        f2 = f2/b2;
    end
    
end

end