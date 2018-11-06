function [c] = encryptCharacter(n, e, m) 
% Given public key (n, e), encrypt message 'm' into cipher text 'c' 
% Author: Komal Krishneil Sharma
% Code calculates c = m^e mod n and uses some clever maths 
% to calculate it quickly and to avoid rounding errors
 
    %declare an array and assign the alphabets to it
    alphabets = ['ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz:(). '];
    
    %nested for loop that compares each character from 'm' with the
    %alphabets in the above array and assigns its index to a variable
    for counter=1:length(m)
        for position=1:length(alphabets)
            if (m(counter)==alphabets(position))
                positionOfCharacter(counter)= position;
            end
        end
    end
 
    %buffer where we store our numeric cipher text
    cipherTextNumeric = [1:length(m)];
 
    %using the index value from the above for loop, the next part
    %calculates c = m^e mod n and fills the 'c' values in the
    %plainTextNumeric array
    for counter = 1:length(m)
        s = 1; t = positionOfCharacter(counter); u = e;
        while (u > 0)
            if (mod(floor(u),2) == 1)
                s = mod(floor(s)*floor(t), n);
            end
            u = floor(u/2);
            t = floor(mod(t*t, n));
        end
        cipherTextNumeric(counter) = s;
    end
    
    %assigning the array to the function return value 'c'
    c = cipherTextNumeric;
end
