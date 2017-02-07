function [Ioutput, Eoutput] =   prepXtcavData(filename)
load(filename)
time_data = data.px2um*(-data.time_cen+(1:size(data.img,2)))/data.streak;
xrange = (time_data)*(10^-15)*(3*10^11);
yrange = (-data.px2um*(-data.erg_cen+(1:size(data.img,1)))/data.dispersion)*100;

E=sum(data.img,2); 
I=sum(data.img,1);
Iscaled=I./sum(I);
Escaled=E./sum(E);

Ioutput=[xrange; Iscaled];
Eoutput=[yrange; Escaled'];