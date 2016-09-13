rm(list=ls())
### COS VOL BUILD ####

#csv's in KIRK_SCINET_maget_vols

load('# Dataframe with maskids and demo/behavioralinfo.Rdata')

hcam1 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/All_volumes_batch1.csv')
hcam2 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/All_volumes_batch2.csv')
hcam3 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/All_volumes_batch3.csv')
hcam4 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/All_volumes_batch4.csv')
hcam5 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/All_volumes_batch5.csv')
hcam6 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/All_volumes_batch6.csv')

bs1 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch1_bs.csv')
ts1 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch1_ts.csv')
ss1 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch1_ss.csv')

bs2 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch2_bs.csv')
ts2 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch2_ts.csv')
ss2 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch2_ss.csv')

bs3 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch3_bs.csv')
ts3 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch3_ts.csv')
ss3 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch3_ss.csv')

bs4 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch4_bs.csv')
ts4 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch4_ts.csv')
ss4 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch4_ss.csv')

bs5 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch5_bs.csv')
ts5 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch5_ts.csv')
ss5 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch5_ss.csv')


bs6 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch6_bs.csv')
ts6 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch6_ts.csv')
ss6 <- read.csv('~/../../Volumes/Chpvol/KIRK_SCINET/nih_maget_vols/batch6_ss.csv')

hcam <- rbind(hcam1, hcam2, hcam3, hcam4, hcam5, hcam6)

bs <- rbind(bs1, bs2, bs3, bs4, bs5)
names(bs) <- names(bs6)
bs <- rbind(bs, bs6)

ts <- rbind(ts1, ts2, ts3, ts4, ts5)
names(ts) <- names(ts6)
ts <- rbind(ts, ts6)

maskids <- strsplit(as.character(ts$MASKID), '_')

maskids <- sapply(maskids, function(x) x[3])
maskids <- gsub('c', '', maskids)

ts$MASKID <- maskids
ts$MASKID <- as.numeric(ts$MASKID)


ss <- rbind(ss1, ss2, ss3, ss4, ss5)
names(ss) <- names(ss6)
ss <- rbind(ss, ss6)

maskids <- strsplit(as.character(ss$MASKID), '_')

maskids <- sapply(maskids, function(x) x[3])
maskids <- gsub('c', '', maskids)

ss$MASKID <- maskids
ss$MASKID <- as.numeric(ss$MASKID)


sub <- merge.data.frame(bs, ts, by = 'MASKID')
sub <- merge.data.frame(sub, ss, by = 'MASKID')


sub <- sub[match(hcam$MASKID, sub$MASKID),]  

maget <- merge(sub, hcam, by = 'MASKID')


maget$bil.amygdala.v <- with(maget, (L_amygdala + R_amygdala))

maget$l.hipp.v <- with(maget, (L_CA1 + L_subiculum + L_CA4DG + L_CA2CA3 + L_stratum))
maget$r.hipp.v <-  with(maget, (R_CA1 + R_subiculum + R_CA4DG + R_CA2CA3 + R_stratum))
maget$bil.hipp.v <- with(maget, (l.hipp.v + r.hipp.v))

maget$bil.cer.v <- with (maget, (L_III + L_IV + L_V + L_VI + L_Crus_I + L_Crus_II + L_VIIB + 
                           L_VIIIA + L_VIIIB + L_IX + L_X + R_III + R_IV + R_V + R_VI + R_Crus_I + R_Crus_II + 
                           R_VIIB +  R_VIIIA + R_VIIIB + R_IX + R_X + Vermal_I_II + Vermal_III + Vermal_IV + 
                           Vermal_V + Vermal_VI + Vermal_VIIA + Vermal_VIIB + Vermal_VIIIA + Vermal_VIIIB + 
                           Vermal_IX + Vermal_X + L_CM + R_CM)) 

maget$bil.striatum.v <- with(maget, (left_striatum + right_striatum))
maget$bil.thalamus.v <- with(maget, (left_thalamus + right_thalamus))
maget$bil.gp.v <- with(maget, (left_gp + right_gp))

your_data_frame <- merge(your_data_frame, maget, by = 'MASKID')

save(your_data_frame, file = 'xxxxxxxxxxx.Rdata')

