clear vars;
clc;
H=0;
J=1;
tol=1e-4;

%create lattice
p=0.5;
n=100;
A=rand(n);
A=(A<p);
lattice=A*2 - 1;

T=2;
kb=1; %atomic unit
beta=1/(kb*T);

mnew=1e3;
mprev=0;


while diff > tol
    tmp_lattice=zeros(n);
    for i=1:length(lattice)
        for j=1:length(lattice)
            
            if i+1 <= n
                term1=lattice(i+1,j);
            else
                term1=lattice(1,j);
            end
            
            if i-1 >= 1
                term2=lattice(i-1,j);
            else
                term2=lattice(n,j);
            end
            
            if j+1 <= n
                term3=lattice(i,j+1);
            else
                term3=lattice(i,1);
                
            end
            
            if j-1 >=1
                term4=lattice(i,j-1);
            else
                term4=lattice(i,n);
            end

            
            bn=J*(term1+term2+term3+term4)+H;
                        
            change_prob=rand();
            change_limit=1/(1+exp(-2*beta*bn));
            
            if change_prob <= change_limit
                tmp_lattice(i,j)=1;
            else
                tmp_lattice(i,j)=-1;
            end
        end
    end
    lattice=tmp_lattice;
    
    num1=length(lattice(lattice==1));
    num2=length(lattice(lattice==-1));
    mnew=num1*num2/(n*n);
    diff=abs(mnew-mprev);
    mprev=mnew;

end
numberOf1=length(lattice(lattice==1));
numberOfMinus1=length(lattice(lattice==-1));


d = bi2de([4 2 7 1],2,'left-msb')

imagesc(lattice)
colormap gray