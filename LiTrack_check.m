function [beamline] = LiTrack_check(beamline,x)

l=length(x);

for i=1:l
    j=x(i);
    cod = beamline(j,1);
   
    if (abs(cod)==11)	|| (abs(cod)==10)	% ACCELERATION SECTION (11 and 10)
        lam    = beamline(j,4);		% RF wavelength [m]
        if lam<=0
          beamline(j,4) = 0.01;
          disp('reached limit')
        end
    end
    
    if abs(cod) == 13           % energy feedback with two phase-opposed sections, each of eV0 volts @ crest
        eV0    = beamline(j,3);		% acc. voltage available at crest for each of two fdbk sections [GeV]
        if eV0==0
            beamline(j,3) = 0.01;
            disp('reached limit')
        end
        
        lam    = beamline(j,6);         % RF wavelength [m]
        if lam<=0
            beamline(j,6) = 0.01;
            disp('reached limit')
        end
    end
    
    if abs(cod)==15           % resistive-wall wakefield (15)
        r0   = beamline(j,2);		% Beam-pipe radius [m]
        if r0<=0
            beamline(j,2) = 0.01;
            disp('reached limit')
        end
        
        sigc = beamline(j,4);		% Surface conductivity [(Ohm-m)^-1]
        if sigc<=0
            beamline(j,4) =1;
            disp('reached limit')
        end
        
        tau  = beamline(j,5);		% relaxation time (sec) - if =zero, use DC wake
        if tau<0
          beamline(j,5) = 1e-15;
          disp('reached limit')
        end
        
        rf   = beamline(j,6);		% rf=1: cylindrical chamber,  rf=2: parallel plates chamber
        if rf<0 || rf>2
            beamline(j,6) = 2;
            disp('reached limit')
        end
    end
 
    if abs(cod)==17           % CSR (17)
        L    = beamline(j,2);		% Bend magnet length [m]
        if L<0
            beamline(j,2) =0.01;
            disp('reached limit')
        end
    end
   
    
    if abs(cod) == 7              % BUNCH COMPRESSION CHICANE (R56/m, E/GeV [T566=-1.5*R56, U5666=2*R56])
        R56      = beamline(j,2);   % R56 value [m]
        E56  = beamline(j,3);       % Nominal energy of compressor [GeV]
        if R56>0
            beamline(j,2) = -0.001;
            disp('reached limit')
        end

        if E56 < 0.020              % need positive, reasonable nominal R56-energy [GeV]
            beamline(j,3) = 0.02;
            disp('reached limit')
        end
    end
    
    
end




