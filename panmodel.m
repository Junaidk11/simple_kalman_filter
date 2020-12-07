function y = panmodel
    persistent x A
    
    if isempty(x)
        N = 20; dx=5;
        x=(20:-1:0)'*dx;
        a=[ones(1,5-0)*0 ones(1,14-5)*0.5 ones(1,21-14)*0.01]*0.25;
        A=[a;[eye(N,N),zeros(N,1)]];
    end
    
    y=x(14,1)*0.5+x(15,1)*0.5+randn;
    x=A*x;
    x(1)=x(1)+abs( round( 3*randn() ) );