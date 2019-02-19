% Block for m=1

function [length1] = Block1(lattice)

length1=zeros(4,4);
length1(:,1)=-1;

stop=0;

for i=1:length(lattice)
    for j=1:length(lattice)
        
        if i== 1
            binary=[lattice(length(lattice),j),lattice(i+1,j)];
        elseif i == length(lattice)
            binary=[lattice(i-1,j),lattice(1,j)];        
        else
        binary=[lattice(i,j-1),lattice(i,j+1)];
        end
        
        decimal(i,j)=bi2de(binary,2);
        
        for k=1:4
            if decimal(i,j) == length1(k,1) && stop == 0
                length1(k,1) = decimal(i,j);
                if lattice(i,j) > 0
                    length1(k,2) = length1(k,2)+1;
                elseif lattice(i,j) < 0
                    length1(k,3) = length1(k,3)+1;     
                end
                length1(k,4)=length1(k,2)+length(k,3);
                stop =1;
                
                elseif lenght(k,1) == -1 && stop == 0
                length1(k,1) = decimal(i,j);
                if lattice(i,j) > 0
                    length1(k,2) = length1(k,2)+1;
                elseif lattice(i,j) < 0
                    length1(k,3) = length1(k,3)+1;      
                end
                length1(k,4)=length1(k,2)+length(k,3);
                stop=1;
            end
        end
    end
end