function [Sm,ones_ek_t,ones_w_t,singular,regular] = Sm_init_arrays(w_ln,e_ln)
    Sm=zeros(1,w_ln);
    ones_ek = ones(1,e_ln);
    ones_ek_t = ones_ek';
    ones_w = ones(w_ln,1);
    ones_w_t = ones_w';
    singular = zeros(e_ln,w_ln);
    regular = ones(e_ln,w_ln);
end