function plotSampleConfigurationSpaceTwoLink(L1, L2, W, obsCirc, circR, sampling_method, n )
x = [];
y = [];
%sampling_method = 'halton';

hold on
if(strcmp(sampling_method,'sukharevGrid'))
    if(sqrt(n) == floor(sqrt(n)))
        [x y] = computeGridSukharev_mod(sqrt(n));   %sukharev sampling
        for i = 1:n
            [obsHitFlag,collideFirstLink,collideSecondLink] =  checkCollisionTwoLink(L1,L2,W,x(i)*2*pi,y(i)*2*pi-x(i)*2*pi,obsCirc,circR);
            if(obsHitFlag & collideFirstLink)
                plot(x(i)*2*pi,y(i)*2*pi,'*k')
            elseif(obsHitFlag & collideSecondLink)
                plot(x(i)*2*pi,y(i)*2*pi,'*r')
            else
                plot(x(i)*2*pi,y(i)*2*pi,'*b')
            end
        end
    else
        disp('error: enter perfect square n for sukharev grid')
    end
    
elseif(strcmp(sampling_method,'halton'))    %halton sequence sampling
    b1 = 3;     %b1,b2 are arbitrary prime numbers
    b2 = 2;
    [s1,s2] = halton(n,b1,b2);  
    for i = 1:n
        [obsHitFlag,collideFirstLink,collideSecondLink] =  checkCollisionTwoLink(L1,L2,W,s1(i)*2*pi,s2(i)*2*pi-s1(i)*2*pi,obsCirc,circR);
        if(obsHitFlag & collideFirstLink)
            plot(s1(i)*2*pi,s2(i)*2*pi,'*k')
        elseif(obsHitFlag & collideSecondLink)
            plot(s1(i)*2*pi,s2(i)*2*pi,'*r')
        else
            plot(s1(i)*2*pi,s2(i)*2*pi,'*b')
        end
    end
elseif(strcmp(sampling_method,'unifRand'))  %uniform random sampling
    x = rand(1,n);
    y = rand(1,n);
    for i = 1:n
        [obsHitFlag,collideFirstLink,collideSecondLink] =  checkCollisionTwoLink(L1,L2,W,x(i)*2*pi,y(i)*2*pi-x(i)*2*pi,obsCirc,circR);
        if(obsHitFlag & collideFirstLink)
            plot(x(i)*2*pi,y(i)*2*pi,'*k')
        elseif(obsHitFlag & collideSecondLink)
            plot(x(i)*2*pi,y(i)*2*pi,'*r')
        else
            plot(x(i)*2*pi,y(i)*2*pi,'*b')
        end
    end
end
axis([0 2*pi, 0 2*pi])
xlabel('\alpha')
end