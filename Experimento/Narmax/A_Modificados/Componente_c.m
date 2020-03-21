function Componente_c(m, p)

    global c;
    global nu;
    global ny;
    
    count = 2;
    
    for i=m:1:ny
        str = sprintf('n%d', i);
        c{m+1, p+1, count} = str;
        count = count + 1;
    end
    
    for i=m-p:1:nu
        str = sprintf('n%d', i);
        c{m+1, p+1, count} = str;
        count = count + 1;
    end
end