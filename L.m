function L = L(w,y,x)
L = 0;
for i=1:length(w)
    l = 1;
    for j = 1:length(w)
        if j~=i
            l = l * ((x-w(j))/(w(i)-w(j)));
        end
    end
    L = L + l*y(i);
end
end
