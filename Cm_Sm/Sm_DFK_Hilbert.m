function Sm = Sm_DFK_Hilbert(Cm)
    Sm = -imag(hilbert(Cm)); % we need the minus sign to get the right fishbone direction
end