function [list] = m3(lattice)
%M3 Summary of this function goes here
%   Detailed explanation goes here
numOfCombinations=64;
list=zeros(numOfCombinations,4)-1;

sweep=zeros(1,6);
lengthOfLattice=length(lattice(:,1));
stop=0;

for i=1:lengthOfLattice
    for j=1:lengthOfLattice
       
        sweep(1)=lattice(mod(i-2,lengthOfLattice)+1,mod(j+1,lengthOfLattice)+1);
        sweep(2)=lattice(mod(i-1,lengthOfLattice)+1,mod(j+1,lengthOfLattice)+1);
        sweep(3)=lattice(mod(i,lengthOfLattice)+1,mod(j+1,lengthOfLattice)+1);
        sweep(4)=lattice(mod(i,lengthOfLattice)+1,mod(j-1,lengthOfLattice)+1);
        sweep(5)=lattice(mod(i+1,lengthOfLattice)+1,mod(j-1,lengthOfLattice)+1);
        sweep(6)=lattice(mod(i+2,lengthOfLattice)+1,mod(j-1,lengthOfLattice)+1);
        for k=1:length(sweep)
            if sweep(k)==-1
                sweep(k)=0;
            end
        end
        x=lattice(mod(i,lengthOfLattice)+1,mod(j,lengthOfLattice)+1);
        
        d=bi2de(sweep,2);
        
        for k=1:numOfCombinations
            if list(k,1)==-1 && stop==0
                list(k,1)=d;
                if x==1
                    list(k,2)=list(k,2)+1;
                else
                    list(k,3)=list(k,3)+1;
                end
                list(k,4)=list(k,4)+1;
                stop=1;
            elseif list(k,1)==d && stop==0
                if x==1
                    list(k,2)=list(k,2)+1;
                else
                    list(k,3)=list(k,3)+1;
                end
                list(k,4)=list(k,4)+1;
                stop=1;
            end
        end
        stop=0;
    end
end



end

