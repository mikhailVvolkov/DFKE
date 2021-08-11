function theta = E2th(F,mu,w_pump,energy_array) 
    theta = sqrt(2*energy_array)*(cnst.c_light)*F./(sqrt(mu)*cnst.h_bar*(w_pump^2)); 
end