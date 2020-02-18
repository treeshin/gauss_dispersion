clear
frequency

hs = 68; %Stack height (m)
w0 = 10; %Plume exit velocity
diameter = 2; %Stack inner diameter

sl = hs; %Desired wind height (same as hs)
pl = 10; %Measured wind height

x=[1:80000];

xoq = zeros(1, length(x));
for k=1:length(x)
    for j=1:7
        for i=1:5
            winspeed_corrected = u_cor(winspeed, sl, pl, j);
            sigma = calc_sigma(x(k),j);
            he=calc_he(j,hs,w0,winspeed_corrected(i),diameter,x(k));
            xoq(k) = xoq(k) + (freq(5*(j-1)+i, 1)/(100*winspeed_corrected(i)*sigma))*exp(he^2/(-2*sigma^2));
        end
    end
    xoq(k) = 2.032 * xoq(k) / x(k);
end

xoq = xoq';

doq = zeros(1, length(x));
for k=1:length(x)
    for j=1:7
        winspeed_corrected = u_cor(winspeed, sl, pl, j);
        for i=1:5
            he=calc_he(j,hs,w0,winspeed_corrected(i),diameter,x(k));
            D = calc_d(x(k), j, he);  %effective plume height를 넣는게 맞겠죠?
            doq(k) = doq(k) + (freq(5*(j-1)+i, 1)*D)/(100*(2*pi/16)*x(k));
        end
    end
end

doq=doq';
