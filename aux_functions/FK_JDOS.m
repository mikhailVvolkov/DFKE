function JDOS = FK_JDOS(e_photon,BG,mu,F)
    e_eo = e_electrooptic(mu,F);
    e_kn = - e_kinetic_norm(e_photon,BG,e_eo); % this "-" sign is intended. Literature is not always correct here.
    JDOS = JDOS_const(mu)*pi*sqrt(e_eo).*(airy(1,e_kn).^2-e_kn.*(airy(0,e_kn)).^2);
    if any(e_eo==0)
        %JDOS(e_eo==0,:)=JDOS_const(mu)*heaviside(e_photon-BG).*abs(sqrt(e_photon-BG)); % Eliminate NaNs due to infinite e_kin_norm
        JDOS(e_eo==0,:)=JDOS_const(mu)*my_heaviside(e_photon-BG).*abs(sqrt(e_photon-BG)); % Eliminate NaNs due to infinite e_kin_norm
    end
end