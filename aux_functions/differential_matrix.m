function d_mtx = differential_matrix(non_eq,eq,remove_eq)
   sz = size(non_eq);
   d_mtx = non_eq.' - remove_eq*eq.'*ones(1,sz(1));
end