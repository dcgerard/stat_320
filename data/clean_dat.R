library(tidyverse)

# betacar
betacar <- read_csv("../data_raw/betacar.csv")
betacar |>
  mutate(Prepar = recode(Prepar,
                         '1' = 'SOL',
                         '2' = 'ROCHE',
                         '3' = 'BASF-30',
                         '4' = 'BASF-60')) |>
  write_csv("./betacar.csv")

## blood
blood <- read_csv("../data_raw/blood.csv")
blood |>
  mutate(
    case = recode(case, '1' = 'case', '0' = 'control'),
    curpmh = recode(curpmh, '1' = 'yes', '0' = 'no'),
    estrone = na_if(estrone, 999),
    testost = na_if(testost, 999),
    prolactn = na_if(prolactn, 99.99)) ->
  blood
write_csv(blood, file = "./blood.csv")

# boneden

boneden <- read_csv("../data_raw/boneden.csv")
boneden |>
  mutate(
    zyg = recode(zyg, "1" = "mz", "2" = "dz"),
    men1 = recode(men1, "0" = "pre", "1" = "post", "2" = "unknown"),
    men2 = recode(men2, "0" = "pre", "1" = "post", "2" = "unknown")) ->
  boneden
write_csv(boneden, file = "./boneden.csv")

# botox
botox <- read_csv("../data_raw/botox.csv", na = "999")
botox |>
  mutate(gender = recode(gender, "1" = "male", "0" = "female", "9" = NA_character_),
         group = recode(group, '1' = 'TL', '2' = 'Placebo', '3' = 'Botox')) ->
  botox

write_csv(botox, "./botox.csv")

# breast
breast <- read_csv("../data_raw/breast.csv")
breast |>
  mutate(
    case = recode(case, '1' = 'case', '0' = 'control'),
    bbd = recode(bbd, '1' = 'yes', '0' = 'no'),
    famhx = recode(famhx, '1' = 'yes', '0' = 'no'),
    pmh = recode(pmh, '2' = 'never user', '3' = 'current user'),
    csmk = recode(csmk, '1' = 'yes', '0' = 'no'),
    psmk = recode(psmk, '1' = 'yes', '0' = 'no')) ->
  breast
write_csv(breast, "./breast.csv")

# corneal
corneal <- read_csv("../data_raw/corneal.csv", na = "99")
corneal |>
  mutate(tr = recode(tr, '1' = 'M', '2' = 'G', '3' = 'P')) |>
  write_csv("./corneal.csv")

# diabetes
diabetes <- read_csv("../data_raw/diabetes.csv", na = "999.9")
write_csv(diabetes, "./diabetes.csv")

# ear
ear <- read_csv("../data_raw/ear.csv")
ear |>
  mutate(
    Clear = recode(Clear, '1' = 'yes', '0' = 'no'),
    Antibo = recode(Antibo, '1' = 'CEF', '2' = 'AMO'),
    Age = recode(Age, '1' = '<2', '2' = '2-5', '3' = '6+')) ->
  ear
write_csv(ear, "./ear.csv")

# eff
eff <- read_csv("../data_raw/eff.csv")
eff |>
  mutate(
    Antibio = recode(Antibio, '1' = 'Amikacin', '2' = 'Gentamicin', '3' = 'Netilmicin', '4' = 'Sisomycin', '5' = 'Tobramycin')) ->
  eff
write_csv(eff, "./eff.csv")


# estradl
estradl <- read_csv("../data_raw/estradl.csv")
estradl |>
  mutate(
    Ethnic = recode(Ethnic, '0' = 'African-American', '1' = 'Caucasian'),
    Anykids = recode(Anykids, '1' = 'yes', '0' = 'no', '9' = NA_character_),
    Numchild = na_if(Numchild, 9),
    Agefbo = na_if(Agefbo, 99),
    Agemenar = na_if(Agemenar, 99)) ->
  estradl
write_csv(estradl, "./estradl.csv")

# estrogen
estrogen <- read_csv("../data_raw/estrogen.csv", na = "999")
estrogen |>
  mutate(std_typ = recode(std_typ, '1' = '0.625MG VS PLACEBO', '2' = '1.25MG VS PLACEBO', '3' = '1.25MG VS 0.625MG'),
         trtgrp = recode(trtgrp, '1' = 'PLACEBO', '2' = '0.625MG', '3' = '1.25MG')) ->
  estrogen
write_csv(estrogen, "./estrogen.csv")

# fev
fev <- read_csv("../data_raw/fev.csv")
fev |>
  mutate(
    Sex = recode(Sex, '0' = 'female', '1' = 'male'),
    Smoke = recode(Smoke, '0' = 'non-current', '1' = 'current')) ->
  fev
write_csv(fev, "./fev.csv")

# field
field <- read_csv("../data_raw/field.csv")
field |>
  mutate(group = recode(group, '1' = 'RHO', '2' = 'RPGR'),
         gender = recode(gender, '1' = 'male', '2' = 'female'),
         dtvisit = mdy(dtvisit)) ->
  field
write_csv(field, "./field.csv")

# hormone
hormone <- read_csv("../data_raw/hormone.csv")
hormone |>
  mutate(Hormone = recode(Hormone, '1' = 'SAL', '2' = 'APP', '3' = 'CCK', '4' = 'SEC', '5' = 'VIP')) ->
  hormone
write_csv(hormone, "./hormone.csv")

# hospital
hospital <- read_csv("../data_raw/hospital.csv")
hospital |>
  mutate(Sex = recode(Sex, '1' = 'male', '2' = 'female'),
         Antibio = recode(Antibio, '1' = 'yes', '2' = 'no'),
         Bact_cul = recode(Bact_cul, '1' = 'yes', '2' = 'no'),
         Service = recode(Service, '1' = 'med', '2' = 'surg')) ->
  hospital
write_csv(hospital, "./hospital.csv")

# infantbp
infantbp <- read_csv("../data_raw/infantbp.csv", na = "999.99")
infantbp |>
  mutate(Mn_sbp = na_if(Mn_sbp, 99.99),
         Mn_dbp = na_if(Mn_dbp, 99.99)) ->
  infantbp

write_csv(infantbp, "./infantbp.csv")

# lead
lead <- read_csv("../data_raw/lead.csv", na = "99")
lead |>
  mutate(area = recode(area, '1' = '0-1', '2' = '1-2.5', '3' = '2.5-4.1'),
         sex = recode(sex, '1' = 'male', '2' = 'female'),
         iq_type = recode(iq_type, '1' = 'WISC', '2' = 'WPPSI'),
         Group = recode(Group, '1' = 'control', '2' = 'exposed'),
         fst2yrs = recode(fst2yrs, '1' = 'yes', '2' = 'no'),
         pica = recode(pica, '1' = 'yes', '2' = 'no'),
         colic = recode(colic, '1' = 'yes', '2' = 'no'),
         clumsi = recode(clumsi, '1' = 'yes', '2' = 'no'),
         irrit = recode(irrit, '1' = 'yes', '2' = 'no'),
         convul = recode(convul, '1' = 'yes', '2' = 'no'),
         lead_grp = recode(lead_grp, '1' = 'control', '2' = 'current exposed', '3' = 'previous exposed')) ->
  lead
write_csv(lead, "./lead.csv")

# lmv
lmv <- read_csv("../data_raw/lmv.csv")
lmv |>
  mutate(bpcat = recode(bpcat, '1' = 'normal', '2' = 'pre-hypertensive', '3' = 'hypertensive'),
         gender = recode(gender, '1' = 'male', '2' = 'female')) ->
  lmv
write_csv(lmv, "./lvm.csv")

# mice
mice <- read_csv("../data_raw/mice.csv", na = "9999")
mice |>
  mutate(Group = recode(Group, '1' = 'RP', '2' = 'NORMAL'),
         Trtgrp = recode(Trtgrp, 'A' = 'LIGHT', 'B' = 'DIM', 'C' = 'DARK')) ->
  mice
write_csv(mice, "./mice.csv")

# nephro
nephro <- read_csv("../data_raw/nephro.csv")
nephro |>
  mutate(Antibio = recode(Antibio, '1' = 'Amikacin', '2' = 'Gentamicin', '3' = 'Netilmicin', '4' = 'Sisomycin', '5' = 'Tobramycin')) ->
  nephro
write_csv(nephro, "./nephro.csv")

# niphed
nifed <- read_csv("../data_raw/nifed.csv", na = "999")
write_csv(nifed, "./nifed.csv")

# oto
oto <- read_csv("../data_raw/oto.csv")
oto |>
  mutate(Endpnt = recode(Endpnt, '1' = 'efficacy', '2' = 'nephrotoxicity', '3' = 'ototoxicity'),
         Antibio = recode(Antibio, '1' = 'Amikacin', '2' = 'Gentamicin', '3' = 'Netilmicin', '4' = 'Sisomycin', '5' = 'Tobramycin')) ->
  oto
write_csv(oto, "./oto.csv")

# piriform
piriform <- read_csv("../data_raw/piriform.csv")
piriform |>
  mutate(piriform = recode(piriform, '1' = 'Negative', '2' = 'Positive'),
         sex = recode(sex, '1' = 'male', '2' = 'female')) ->
  piriform
write_csv(piriform, "./piriform.csv")

# smoke
smoke <- read_csv("../data_raw/smoke.csv", na = c("999", "9999"))
smoke |>
  mutate(Gender = recode(Gender, '1' = 'male', '2' = 'female')) ->
  smoke
write_csv(smoke, "./smoke.csv")

# swiss
swiss <- read_csv("../data_raw/swiss.csv", na = "9.99")
swiss |>
  mutate(group = recode(group, '1' = 'High NAPAP', '2' = 'Low NAPAP', '3' = 'control')) ->
  swiss
write_csv(swiss, "./swiss.csv")

# temperat
temperat <- read_csv("../data_raw/temperat.csv")
temperat |>
  mutate(Cor_fac = recode(Cor_fac, '1' = 'yes', '0' = 'no'),
         Typ_wea = recode(Typ_wea, '1' = 'SUNNY', '2' = 'PARTLY CLOUDY', '3' = 'CLOUDY', '4' = 'RAINY', '5' = 'FOGGY', '9' = NA_character_)) ->
  temperat
write_csv(temperat, "./temperat.csv")

# tennis1
tennis1 <- read_csv("../data_raw/tennis1.csv")
tennis1 |>
  mutate(Age = na_if(Age, 99),
         Num_epis = na_if(Num_epis, 9),
         Sex = recode(Sex, '1' = 'male', '2' = 'female'),
         Typ_last = recode(Typ_last, '1' = 'CONVENTIONAL SIZE', '2' = 'MID-SIZE', '3' = 'OVER-SIZE','9' = NA_character_),
         Wgt_last = recode(Wgt_Last, '1' = 'HEAVY', '2' = 'MEDIUM', '3' = 'LIGHT', '4' = 'DO NOT KNOW', '9' = NA_character_),
         Mat_last = recode(Mat_last, '1' = 'WOOD', '2' = 'ALUMINUM', '3' = 'FIBERGLASS AND COMPOSITE', '4' = 'GRAPHITE', '5' = 'STEEL', '6' = 'COMPOSITE', '7' = 'OTHER', '9' = NA_character_),
         Str_last = recode(Str_last, '1' = 'NYLON', '2' = 'GUT', '3' = 'DO NOT KNOW', '9' = NA_character_),
         Typ_curr = recode(Typ_curr, '1' = 'CONVENTIONAL SIZE', '2' = 'MID-SIZE', '3' = 'OVER-SIZE','9' = NA_character_),
         Wgt_curr = recode(Wgt_curr, '1' = 'HEAVY', '2' = 'MEDIUM', '3' = 'LIGHT', '4' = 'DO NOT KNOW', '9' = NA_character_),
         Mat_curr = recode(Mat_curr, '1' = 'WOOD', '2' = 'ALUMINUM', '3' = 'FIBERGLASS AND COMPOSITE', '4' = 'GRAPHITE', '5' = 'STEEL', '6' = 'COMPOSITE', '7' = 'OTHER', '9' = NA_character_),
         Str_curr = recode(Str_curr, '1' = 'NYLON', '2' = 'GUT', '3' = 'DO NOT KNOW', '9' = NA_character_)) |>
  select(-Wgt_Last) ->
  tennis1
write_csv(tennis1, "./tennis1.csv")

# tennis2
tennis2 <- read_csv("../data_raw/tennis2.csv", na = "9")
tennis2 |>
  mutate(sex = recode(sex, '1' = 'male', '2' = 'female', '9' = NA_character_),
         drg_ord = recode(drg_ord, '1' = 'MOTRIN-PLACEBO','2' = 'PLACEBO-MOTRIN')) ->
  tennis2
write_csv(tennis2, "./tennis2.csv")
