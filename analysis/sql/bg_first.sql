-- This query extracts Blood gas analysis data 
-- At admission (the first available data 24 hours prior to, or 24 hours after, ICU admission)  

WITH unique_icustays AS(
SELECT
DISTINCT patientunitstayid
FROM `physionet-data.eicu_crd.patient` 
), fio2_first_sq AS(
SELECT
  patientunitstayid
, fio2 AS fio2_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_bg` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), pao2_first_sq AS(
SELECT
  patientunitstayid
, pao2 AS pao2_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_bg` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
),paco2_first_sq AS(
SELECT
  patientunitstayid
, paco2 AS paco2_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_bg` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), pH_first_sq AS(
SELECT
  patientunitstayid
, pH AS pH_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_bg` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), aniongap_first_sq AS(
SELECT
  patientunitstayid
, aniongap AS aniongap_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_bg` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), basedeficit_first_sq AS(
SELECT
  patientunitstayid
, basedeficit AS basedeficit_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_bg` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), baseexcees_first_sq AS(
SELECT
  patientunitstayid
, baseexcess AS baseexcess_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_bg` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), peep_first_sq AS(
SELECT
  patientunitstayid
, peep AS peep_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_bg` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
)
SELECT patientunitstayid
,fio2_first
,pao2_first
,paco2_first
,pH_first
,aniongap_first
,basedeficit_first
,baseexcess_first
,peep_first
FROM unique_icustays
LEFT JOIN
fio2_first_sq
USING
(patientunitstayid)
LEFT JOIN
pao2_first_sq
USING
(patientunitstayid)
LEFT JOIN
paco2_first_sq
USING
(patientunitstayid)
LEFT JOIN
pH_first_sq
USING
(patientunitstayid)
LEFT JOIN
aniongap_first_sq
USING
(patientunitstayid)
LEFT JOIN
basedeficit_first_sq
USING
(patientunitstayid)
LEFT JOIN
baseexcees_first_sq
USING
(patientunitstayid)
LEFT JOIN
peep_first_sq
USING
(patientunitstayid)
WHERE
    fio2_first_sq.rn = 1
AND pao2_first_sq.rn = 1
AND paco2_first_sq.rn = 1
AND pH_first_sq.rn = 1
AND aniongap_first_sq.rn = 1
AND basedeficit_first_sq.rn = 1
AND baseexcees_first_sq.rn = 1
AND peep_first_sq.rn = 1