function [winspeed_corrected] = u_cor(winspeed,sl,pl,stability)
%Wind-speed correction
switch stability
    case {1, 2, 3, 4}
        ex = 0.25;
        
    case {5, 6, 7}
        ex = 0.50;
end

cor = (sl/pl)^ex;
winspeed_corrected = cor * winspeed;
end
