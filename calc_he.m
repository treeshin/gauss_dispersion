function [he] = calc_he(stability,hs,w0,winspeed,D,x)
%CALC_HE 이 함수의 요약 설명 위치
%   자세한 설명 위치

switch stability
    case {1, 2, 3, 4} %Stability A, B, C, D
        if w0 >= 1.5 * winspeed
            hprA = 1.44*(w0/winspeed)^(2/3)*(x/D)^(1/3)*D;
            hprB = 3*(w0/winspeed)*D;
            hpr = min(hprA, hprB);
        else
            C = 3*(1.5-w0/winspeed)*D;
            hprA = 1.44*(w0/winspeed)^(2/3)*(x/D)^(1/3)*D-C;
            hprB = 3*(w0/winspeed)*D;
            hpr = min(hprA, hprB);
        end
        
    case 5 %Stability E
        Fm = (w0*D/2)^2;
        S = 8.7 * 10^-4;
        if w0 >= 1.5 * winspeed
            hprA = 1.44*(w0/winspeed)^(2/3)*(x/D)^(1/3)*D;
            hprB = 3*(w0/winspeed)*D;
            hprC = 4*(Fm/S)^(1/4);
            hprD = 1.5*(Fm/winspeed)^(1/3)*S^(-1/6);
            hpr = min([hprA, hprB, hprC, hprD]);
        else
            C = 3*(1.5-w0/winspeed)*D;
            hprA = 1.44*(w0/winspeed)^(2/3)*(x/D)^(1/3)*D-C;
            hprB = 3*(w0/winspeed)*D;
            hprC = 4*(Fm/S)^(1/4);
            hprD = 1.5*(Fm/winspeed)^(1/3)*S^(-1/6);
            hpr = min([hprA, hprB, hprC, hprD]);
        end
        
    case 6 %Stability F
        Fm = (w0*D/2)^2;
        S = 1.75 * 10^-3;
        if w0 >= 1.5 * winspeed
            hprA = 1.44*(w0/winspeed)^(2/3)*(x/D)^(1/3)*D;
            hprB = 3*(w0/winspeed)*D;
            hprC = 4*(Fm/S)^(1/4);
            hprD = 1.5*(Fm/winspeed)^(1/3)*S^(-1/6);
            hpr = min([hprA, hprB, hprC, hprD]);
        else
            C = 3*(1.5-w0/winspeed)*D;
            hprA = 1.44*(w0/winspeed)^(2/3)*(x/D)^(1/3)*D-C;
            hprB = 3*(w0/winspeed)*D;
            hprC = 4*(Fm/S)^(1/4);
            hprD = 1.5*(Fm/winspeed)^(1/3)*S^(-1/6);
            hpr = min([hprA, hprB, hprC, hprD]);
        end
        
    case 7 %Stability G
        Fm = (w0*D/2)^2;
        S = 2.45 * 10^-3;
        if w0 >= 1.5 * winspeed
            hprA = 1.44*(w0/winspeed)^(2/3)*(x/D)^(1/3)*D;
            hprB = 3*(w0/winspeed)*D;
            hprC = 4*(Fm/S)^(1/4);
            hprD = 1.5*(Fm/winspeed)^(1/3)*S^(-1/6);
            hpr = min([hprA, hprB, hprC, hprD]);
        else
            C = 3*(1.5-w0/winspeed)*D;
            hprA = 1.44*(w0/winspeed)^(2/3)*(x/D)^(1/3)*D-C;
            hprB = 3*(w0/winspeed)*D;
            hprC = 4*(Fm/S)^(1/4);
            hprD = 1.5*(Fm/winspeed)^(1/3)*S^(-1/6);
            hpr = min([hprA, hprB, hprC, hprD]);
        end
end

he = hs + hpr;
end

