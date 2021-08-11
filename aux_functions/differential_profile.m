function delta = differential_profile(non_eq,eq)
    sz = size(non_eq);
    if sz(2)>1
        delta = mean(non_eq,1) - eq;
    elseif sz(2)==1
        delta = non_eq - eq;
    else
        disp('Wrong array dimensions');
        disp(sz);
    end
end
