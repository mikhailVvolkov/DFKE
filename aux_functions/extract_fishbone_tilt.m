%% Fishbone tilt analysis.
function extract_fishbone_tilt(JDOS,sc,lp)   
    sz = size(JDOS);
    for i = 1:sz(1)
        ft(i,:) = ifftshift(fft(fftshift(JDOS(i,:))));
    end
    
    abs_profile = sum(abs(JDOS),2);
    figure;plot(sc.XUV,abs_profile);
    signal_region = boolean((abs_profile./max(abs_profile))>0.75);
    [M,I] = max(mean(abs(ft),1));
    figure;plot(angle(ft(signal_region,I)),sc.XUV(signal_region));
    xlabel('Photon energy (eV)')
    ylabel('Phase (rad)');
    x_to_fit = angle(ft(signal_region,I))./(2*lp.w);
    y_to_fit = sc.XUV(signal_region);
    cftool(x_to_fit(5:end-8),y_to_fit(5:end-8));
end