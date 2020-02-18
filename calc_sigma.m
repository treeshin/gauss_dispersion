function [sigma] = calc_sigma(x,stability)
%CALC_SIGMA
%Calculate sigma_zj(x), vertical spread for stability j and distance x
%Based on KINS regulatory guide
%Stability A=1, B=2, C=3, D=4, E=5, F=6, G=7

switch stability
    
    case 1 %Stability A
        if x < 100
            a=0.192; b=0.936; c=0;
            
        elseif x >= 100 && x < 1000
            a=0.00066; b=1.941; c=9.27;
            
        elseif x >= 1000
            a=0.00024; b=2.094; c=-9.6;
        end
        
    case 2 %Stability B
        if x < 100
            a=0.156; b=0.922; c=0;
            
        elseif x >= 100 && x < 1000
            a=0.0382; b=1.149; c=3.3;
            %Different from KINS
            
        elseif x >= 1000
            a=0.055; b=1.098; c=2;
        end
        
    case 3 %Stability C
        if x < 100
            a=0.116; b=0.905; c=0;
            
        elseif x >= 100 && x < 1000
            a=0.113; b=0.911; c=0;
            
        elseif x >= 1000
            a=0.113; b=0.911; c=0;
        end
        
    case 4 %Stability D
        if x < 100
            a=0.079; b=0.881; c=0;
            
        elseif x >= 100 && x < 1000
            a=0.222; b=0.725; c=-1.7;
            
        elseif x >= 1000
            a=1.26; b=0.516; c=-13;
        end
        
    case 5 %Stability E
        if x < 100
            a=0.063; b=0.871; c=0;
            
        elseif x >= 100 && x < 1000
            a=0.211; b=0.678; c=-1.3;
            
        elseif x >= 1000
            a=6.73; b=0.305; c=-34;
        end
        
    case 6 %Stability F
        if x < 100
            a=0.053; b=0.814; c=0;
            
        elseif x >= 100 && x < 1000
            a=0.086; b=0.74; c=-0.35;
            
        elseif x >= 1000
            a=18.05; b=0.18; c=-48.6;
        end
        
    case 7 %Stability G
        if x < 100
            a1=0.063; b1=0.871; c1=0; %Stability E
            a2=0.053; b2=0.814; c2=0; %Stability F
            
        elseif x >= 100 && x < 1000
            a1=0.211; b1=0.678; c1=-1.3; %Stability E
            a2=0.086; b2=0.74; c2=-0.35; %Stability F
            
        elseif x >= 1000
            a1=6.73; b1=0.305; c1=-34; %Stability E
            a2=18.05; b2=0.18; c2=-48.6; %Stability F
        end
        
end

%Calculate sigma
if stability  < 7
    sigma = a*x^b + c;
    if sigma > 1000
        sigma = 1000;
    end
else
    %     sigma = 0.6*(a2*x^b2 + c2);
    sigma = 2*log10(a2*x^b2 + c2) - log10(a1*x^b1 + c1);
    sigma = 10^(sigma);
    if sigma > 1000
        sigma = 1000;
    end
end