x2 = [
402.336804800000,804.673609500000,1207.01041400000,1609.34721900000,2414.02082900000,3218.69443800000,4023.36804800000,4828.04165700000,5632.71526700000,6437.38887600000,7242.06248600000,8046.73609500000,12070.1041400000,16093.4721900000,24140.2082900000,32186.9443800000,40233.6804800000,48280.4165700000,56327.1526700000,64373.8887600000,72420.6248600000,80467.3609500000    
]';
nrc_xoqA=[
7.533E-06 3.928E-06 1.349E-06 7.097E-07 4.921E-07 3.795E-07 3.103E-07 2.632E-07 2.290E-07 2.026E-07 1.801E-07 1.621E-07 1.081E-07 8.104E-08 5.403E-08 4.052E-08 3.242E-08 2.701E-08 2.315E-08 2.026E-08 1.801E-08 1.621E-08
]';

nrc_xoqB=[
2.495E-06 4.666E-06 3.354E-06 2.211E-06 1.077E-06 6.161E-07 3.936E-07 2.714E-07 1.976E-07 1.499E-07 1.174E-07 1.009E-07 6.725E-08 5.044E-08 3.362E-08 2.522E-08 2.017E-08 1.681E-08 1.441E-08 1.261E-08 1.121E-08 1.009E-08
]';

nrc_xoqG=[
0.000E+00 2.470E-21 2.810E-14 5.359E-12 2.908E-10 1.542E-09 3.899E-09 7.030E-09 1.054E-08 1.411E-08 1.755E-08 2.074E-08 3.231E-08 3.804E-08 4.111E-08 4.007E-08 3.791E-08 3.554E-08 3.328E-08 3.119E-08 2.931E-08 2.762E-08
]';

nrc_doqA=[
    0.000E+00 8.509E-36 9.324E-32 4.093E-29 1.050E-25 1.646E-23 6.181E-22 9.882E-21 9.003E-20 5.527E-19 2.538E-18 9.338E-18 8.226E-16 1.179E-14 2.431E-13 1.244E-12 3.286E-12 6.004E-12 8.742E-12 1.096E-11 1.240E-11 1.394E-11
    ]';

plot(x, xoq);
hold on
plot(x2, nrc_xoqG,'.');
