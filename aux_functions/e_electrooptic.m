function e_eo = e_electrooptic(mu,F)
    e_eo = ((F*cnst.h_bar*cnst.c_light).^2/2/mu).^(1/3); 
end