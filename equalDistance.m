function x=equalDistance(A,B)
%options = optimset('Display','iter','TolFun',1e-13);
x=fzero(@EqDist, 0.793334860502017)

    function ED=EqDist(x)
    n1=length(A);
    %t=zeros(2,n1);
    t1=x.*ones(1,n1);
    A(1,:)=A(1,:)-t1;
    A=A.*A;
    Asum=sum(A,1);
    Asum=sqrt(Asum);
    Asumdist=sum(Asum)
    n2=length(B);
    %t=zeros(2,n1);
    t2=x.*ones(1,n2);
    B(1,:)=B(1,:)-t2;
    B=B.*B;
    Bsum=sum(B,1);
    Bsum=sqrt(Bsum);
    Bsumdist=sum(Bsum)
    ED=Asumdist-Bsumdist
    end
end
    