function [nodes,e_eo] = FK_nodes(BG,mu,F,num_nodes)
    phi = 0.5;
    n = [0:num_nodes];
    e_eo = e_electrooptic(mu,F);
    nodes = BG+e_eo*(3/8*(n+phi)*(2*pi)).^(2/3); % [eV]
    nodes = [BG, nodes];
end