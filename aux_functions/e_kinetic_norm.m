function e_norm =  e_kinetic_norm(e_photon,BG,e_eo)
    e_kinetic = (e_photon - BG);
    e_norm = e_kinetic./e_eo;
end