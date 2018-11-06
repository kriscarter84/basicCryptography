function [m] = decipher(n,e,c) 
% Given 'n', 'e' and 'c', calculate value of 'd' then decipher to get the text message 
% Author: Komal Krishneil Sharma
% Code calculates d from d*e mod n = 1 then,
% uses value of 'd' to get: m = c*d mod n
 
    %declare an array and assign the alphabets to it
    alphabets = ['ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz:(). '];
    
    %get the factorials of 'n' and compute value of 'x'
    nFactorial = factor(n);
    x = (nFactorial(1)-1)*(nFactorial(2)-1);
    
    %using 'e' and 'x', perform Brute Force to get value of 'd'
    for counter = 1:n
        if (mod(counter*e,x) == 1)
            d = counter;
        end    
    end
    
    %an array to store our numeric cipher text
    positionOfCharacter = [1:length(c)];
    
    %using the index value from the above for loop, the next part
    %calculates m = c^d mod n and fills the 'm' values in the
    %positionOfCharacter array
    for counter = 1:length(c)
        s = 1; t = c(counter); u = d;
        while (u > 0)
            if (mod(floor(u),2) == 1)
                s = mod(floor(s)*floor(t), n);
            end
            u = floor(u/2);
            t = floor(mod(t*t, n));
        end
        positionOfCharacter(counter) = s;
    end
    
    % Convert positionOfCharacter to alphabets that can be read as a
    % message 'm'
    for i = 1:length(positionOfCharacter)
        if positionOfCharacter(i) > length(alphabets)
            decipherMessage(i) = '.';
        else
            decipherMessage(i) = alphabets(positionOfCharacter(i));   
        end
    end
    
    %assigning the decipherMessage to the function return value 'm'
    m = decipherMessage;
end
