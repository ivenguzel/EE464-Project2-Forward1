P=40;                   %Watts
J=500;                  %circ.mils/amp or 400 A/cm^2
K=0.0005;               %constant 0.0005 for forward converter
B=1600;                 %max flux density 
f=30000;                %frequency Hz
Vpmax=48;               %maximum primary voltage V
Vpmin=24;               %minimum primary voltage V
Vout=10;                %output voltage
Iout=4;                 %outout current
Ae=0.971;               %cross section area for 0P43434EC cm^2
Vcore=7.64;             %volume of the core in cm^3
Window_3434=1.21/Ae;    %window area of 0P43434EC in cm^2
T=50;                   %ambient temperature
Nt=26;                   %reset winding number of turns
A_25=0.00162;           %AWG 25 copper area in cm^2
R_25=106.2;             %mohm/m for AWG25
A_17=0.0104;            %AWG 17 copper area in cm^2
R_17=16.61;             %mohm/m for AWG17
A_16=0.0131;            %AWG 16 copper area in cm^2
R_16=13.17;             %mohm/m for AWG16
A_15=0.0165;            %AWG 15 copper area in cm^2
R_15=10.45;             %mohm/m for AWG15


WA=P*J/(K*B*f);                                                                 %Area product 
Np=round(Vpmax*1e08/(4*B*f*Ae));                                                %primary number of turns
Ns=round(((Vout+1)*Np)/(Vpmin*0.5));                                            %secondary number of turns
Pcore=Vcore*3.2*(f^1.46)*((B/10000)^2.75)*(2.45-0.031*T+0.000165*T^2)*1e-06;    %core loss in W, f in Hz, B in G
mlt=(((0.0256/2-0.0111/2)/2)+0.0111/2)*2*pi;                                    %calculation of mean length per turn of the cable in m
Lcop=mlt*(Np+Ns+Nt);                                                            %total cable length in m
Kwind=(A_17*Np+A_15*Ns+A_25*Nt)/Window_3434;                                    %winding factor of 0P43434EC
Rcop=R_15*Lcop;                                                                 %total dc resistance of copper in mOhm
Pcop=Rcop*(Iout^2)/1000;                                                        %copper loss in Watts



