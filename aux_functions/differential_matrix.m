function d_mtx = differential_matrix(non_eq,eq)
   sz = size(non_eq);
   d_mtx = non_eq.' - eq.'*ones(1,sz(1));
end