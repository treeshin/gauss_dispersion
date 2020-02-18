function [D] = calc_d(distance, stability, hs)
%CALC_D
%Calculate D_ij(x), relative Deposition rate for windspeed i? and stability j
%Based on NRC regulatory guide 1.111 and XOQDOQ polynomial fit
%Stability A=1, B=2, C=3, D=4, E=5, F=6, G=7

if hs <= 15
    %Ground release (less than or equal to 15 m)
    %Stability: A, B, C, D, E, F, G
    if distance <= 999
        D = exp(-9.07794+0.4357604*log(distance)-0.07881594*log(distance)*log(distance));
    elseif distance > 999 && distance <= 9999
        D = exp(-6.64143-0.2466506*log(distance)-0.03098147*log(distance)*log(distance));
    else
        D = exp(-14.06597+1.10343*log(distance)-0.09031373*log(distance)*log(distance));
    end
    
elseif hs > 15 && hs <= 45
    switch stability
        case {1, 2, 3}
            %Elevated release (greater than 15 m && less than or equal to 45 m)
            %Stability A, B, C
            
            if distance <= 399
                D = exp(-35.30917 + 9.57035*log(distance) - 0.8727484*log(distance)*log(distance));
            elseif distance > 399 && distance <= 1999
                D = exp(-3.946649 - 0.882866*log(distance));
            elseif distance > 1999 && distance <= 4999
                D = exp(-3.256392 - 1.20884*log(distance) + 0.03092014*log(distance)*log(distance));
            elseif distance > 4999 && distance <= 12999
                D = exp(-5.975507 - 0.6270642*log(distance));
            elseif distance > 12999 && distance <= 19999
                D = exp(12.1268 - 4.455138*log(distance) + 0.202586*log(distance)*log(distance));
            elseif distance > 19999 && distance <= 59999
                D = exp(-10.79479 + 0.01276474*log(distance) - 0.01497699*log(distance)*log(distance));
            else
                D = exp(-54.18442 + 7.877314*log(distance) - 0.3715153*log(distance)*log(distance));
            end
            
        case 4
            %Elevated release (greater than 15 m && less than or equal to 45 m)
            %Stability D
            if distance <= 199
                D = exp(-42.9116 + 8.624134*log(distance) - 0.5286823*log(distance)*log(distance));
            elseif distance > 199 && distance <= 399
                D = exp(-45.080005 + 9.502915*log(distance) - 0.6178266*log(distance)*log(distance));
            elseif distance > 399 && distance <= 1499
                D = exp(-46.40474 + 10.93155*log(distance) - 0.818256*log(distance)*log(distance));
            elseif distance > 1499 && distance <= 6999
                D = exp(-12.06068 + 1.105205*log(distance) - 0.1167178*log(distance)*log(distance));
            elseif distance > 6999 && distance <= 14999
                D = exp(-4.148934 - 0.821923*log(distance));
            else
                D = exp(-4.640997 - 0.7696691*log(distance));
            end
            
        case {5, 6, 7}
            %Elevated release (greater than 15 m && less than or equal to 45 m)
            %Stability E, F, G
            if distance <= 4999
                D = exp(-156.334 + 29.93037*log(distance) - 1.5483*log(distance)*log(distance));
            elseif distance > 4999 && distance <= 8399
                D = exp(-140.62 + 26.18382*log(distance) - 1.324944*log(distance)*log(distance));
            elseif distance > 8399 && distance <= 41999
                D = exp(-87.89882 + 15.38889*log(distance) - 0.7753119*log(distance)*log(distance));
            else
                D = exp(-12.94973 + 1.26526*log(distance) - 0.1098207*log(distance)*log(distance));
            end
            
    end
    
elseif hs > 45 && hs <=80
    switch stability
        case {1, 2, 3}
            %Elevated release (greater than 45 m && less than or equal to 80 m)
            %Stability A, B, C
            if distance <= 399
                D = exp(-30.4523 + 5.76941*log(distance) - 0.394098*log(distance)*log(distance));
            elseif distance > 399 && distance <= 899
                D = exp(-36.23268 + 8.23023*log(distance) - 0.6448782*log(distance)*log(distance));
            elseif distance > 899 && distance <= 2999
                D = exp(-1.56127 - 1.725164*log(distance) + 0.0694564*log(distance)*log(distance));
            elseif distance > 2999  && distance <= 12999
                D = exp(-5.807573 - 0.6388715*log(distance));
            elseif distance > 12999 && distance <= 49999
                D = exp(-0.2792892 - 1.959056*log(distance) + 0.07773757*log(distance)*log(distance));
            else
                D = exp(-58.14337 + 8.633218*log(distance) - 0.4071184*log(distance)*log(distance));
            end
            
        case 4
            %Elevated release (greater than 45 m && less than or equal to 80 m)
            %Stability D
            if distance <= 299
                D = exp(-177.431 + 55.32239*log(distance) - 4.658777*log(distance)*log(distance));
            elseif distance > 299 && distance  <= 999
                D = exp(-58.73299 + 12.91683*log(distance) - 0.8705195*log(distance)*log(distance));
            elseif distance > 999 && distance <= 2999
                D = exp(-45.04643 + 9.088059*log(distance) - 0.6027659*log(distance)*log(distance));
            elseif distance > 2999 && distance <= 19999
                D = exp(-13.59167 + 1.164582*log(distance) - 0.1036683*log(distance)*log(distance));
            else
                D = exp(-4.867893 - 0.7430947*log(distance));
            end
            
        case {5, 6, 7}
            %Elevated release (greater than 45 m && less than or equal to 80 m)
            %Stability E, F, G
            if distance <= 79999
                D = exp(-357.2949 + 59.55312*log(distance) - 2.583151*log(distance)*log(distance));
            else
                D = exp(-134.0653 + 20.00078*log(distance) - 0.8306277*log(distance)*log(distance));
            end
    end
    
else
    %Elevated release (100m)
    %Stability A, B, C
    switch stability
        case {1, 2, 3}
            if distance <= 399
                D = exp(-57.04822 + 13.82261*log(distance) - 1.019382*log(distance)*log(distance));
            elseif distance > 399 && distance <= 2999
                D = exp(-35.26215 + 7.297182*log(distance) - 0.5343292*log(distance)*log(distance));
            elseif distance > 2999 && distance <= 29999
                D = exp(-1.488902 - 1.694416*log(distance) + 0.06353313*log(distance)*log(distance));
            else
                D = exp(-45.70724 + 6.464447*log(distance) - 0.3122405*log(distance)*log(distance));
            end
            
        case 4
            %Elevated release (100m)
            %Stability D
            if distance <= 1499
                D = exp(-63.81157 + 11.90979*log(distance) - 0.6561428*log(distance)*log(distance));
            elseif distance > 1499 && distance <= 9999
                D = exp(-44.54416 + 8.03507*log(distance) - 0.4868832*log(distance)*log(distance));
            else
                D = exp(-9.971805 + 0.1761891*log(distance) -0.04063289*log(distance)*log(distance));
            end
            
        case {5, 6, 7}
            %Elevated release (100m)
            %Stability E, F, G
            D = 0;
    end
end
end