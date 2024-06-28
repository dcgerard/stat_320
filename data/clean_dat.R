library(tidyverse)

# betacar
betacar <- read_csv("./betacar.csv")
betacar |>
  mutate(Prepar = recode(Prepar,
                         '1' = 'SOL',
                         '2' = 'ROCHE',
                         '3' = 'BASF-30',
                         '4' = 'BASF-60')) |>
  write_csv("betacar.csv")

## blood
blood <- read_csv("./blood.csv")
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

boneden <- read_csv("./boneden.csv")
boneden |>
  mutate(
    zyg = recode(zyg, "1" = "mz", "2" = "dz"),
    men1 = recode(men1, "0" = "pre", "1" = "post", "2" = "unknown"),
    men2 = recode(men2, "0" = "pre", "1" = "post", "2" = "unknown")) ->
  boneden
write_csv(boneden, file = "./boneden.csv")

# botox
botox <- read_csv("./botox.csv", na = "999")
botox |>
  mutate(gender = recode(gender, "1" = "male", "0" = "female", "9" = NA_character_),
         group = recode(group, '1' = 'TL', '2' = 'Placebo', '3' = 'Botox')) ->
  botox

write_csv(botox, "./botox.csv")

# breast
breast <- read_csv("./breast.csv")
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
corneal <- read_csv("./corneal.csv", na = "99")
corneal |>
  mutate(tr = recode(tr, '1' = 'M', '2' = 'G', '3' = 'P')) |>
  write_csv("./corneal.csv")

# diabetes
diabetes <- read_csv("./diabetes.csv", na = "999.9")
write_csv(diabetes, "./diabetes.csv")

# ear
ear <- read_csv("./ear.csv")
ear |>
  mutate(
    Antibo = recode(Antibo, '1' = 'CEF', '2' = 'AMO'),
    Age = recode(Age, '1' = '<2', '2' = '2-5', '3' = '6+')) ->
  ear
write_csv(ear, "./ear.csv")

# eff
eff <- read_csv("./eff.csv")
eff |>
  mutate(
    Antibio = recode(Antibio, '1' = 'Amikacin', '2' = 'Gentamicin', '3' = 'Netilmicin', '4' = 'Sisomycin', '5' = 'Tobramycin')) ->
  eff
write_csv(eff, "./eff.csv")


# estradl
estradl <- read_csv("./estradl.csv")
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
estrogen <- read_csv("./estrogen.csv", na = "999")
estrogen |>
  mutate(std_typ = recode(std_typ, '1' = '0.625MG VS PLACEBO', '2' = '1.25MG VS PLACEBO', '3' = '1.25MG VS 0.625MG'),
         trtgrp = recode(trtgrp, '1' = 'PLACEBO', '2' = '0.625MG', '3' = '1.25MG')) ->
  estrogen
write_csv(estrogen, "./estrogen.csv")

# fev
fev <- read_csv("./fev.csv")
fev |>
  mutate(
    Sex = recode(Sex, '0' = 'female', '1' = 'male'),
    Smoke = recode(Smoke, '0' = 'non-current', '1' = 'current')) ->
  fev
write_csv(fev, "./fev.csv")

# field
field <- read_csv("./field.csv")
field |>
  mutate(group = recode(group, '1' = 'RHO', '2' = 'RPGR'),
         gender = recode(gender, '1' = 'male', '2' = 'female'),
         dtvisit = mdy(dtvisit)) ->
  field
write_csv(field, "./field.csv")

# hormone
hormone <- read_csv("./hormone.csv")
hormone |>
  mutate(Hormone = recode(Hormone, '1' = 'SAL', '2' = 'APP', '3' = 'CCK', '4' = 'SEC', '5' = 'VIP')) ->
  hormone
write_csv(hormone, "./hormone.csv")

# hospital
hospital <- read_csv("./hospital.csv")
hospital |>
  mutate(Sex = recode(Sex, '1' = 'male', '2' = 'female'),
         Antibio = recode(Antibio, '1' = 'yes', '2' = 'no'),
         Bact_cul = recode(Bact_cul, '1' = 'yes', '2' = 'no'),
         Service = recode(Service, '1' = 'med', '2' = 'surg')) ->
  hospital
write_csv(hospital, "./hospital.csv")

# infantbp
infantbp <- read_csv("./infantbp.csv", na = "999.99")
infantbp |>
  mutate(Mn_sbp = na_if(Mn_sbp, 99.99),
         Mn_dbp = na_if(Mn_dbp, 99.99)) ->
  infantbp

write_csv(infantbp, "infantbp.csv")

# lead
lead <- read_csv("./lead.csv", na = "99")
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
         convul = recode(convul, '1' = 'yes', '2' = 'no')) ->
  lead
write_csv(lead, "./lead.csv")

# lmv
lmv <- read_csv("./lmv.csv")
lmv |>
  mutate(bpcat = recode(bpcat, '1' = 'normal', '2' = 'pre-hypertensive', '3' = 'hypertensive'),
         gender = recode(gender, '1' = 'male', '2' = 'female')) ->
  lmv
write_csv(lmv, "./lmv.csv")



