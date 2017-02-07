%Convert TREX images into energy vs time

data.px2um*(-data.time_cen+(1:size(data.img,2)))/data.streak
-data.px2um*(-data.erg_cen+(1:size(data.img,1)))/data.dispersion*data.mean_erg
-data.px2um*(-data.erg_cen+(1:size(data.img,1)))/data.dispersion