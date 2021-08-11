function Cm_Sm_save(full_path,Cm,Sm)
    save([full_path, 'Cm.mat'],'Cm');
    save([full_path, 'Sm.mat'],'Sm');
end