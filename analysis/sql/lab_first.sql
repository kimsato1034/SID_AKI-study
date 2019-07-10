-- This query extracts Lab analysis data 
-- At admission (the first available data 24 hours prior to, or 24 hours after, ICU admission)  

WITH unique_icustays AS(
SELECT
DISTINCT patientunitstayid
FROM `physionet-data.eicu_crd.patient` 
), albumin_first_sq AS(
SELECT
  patientunitstayid
, albumin AS albumin_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_lab` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), bilirubin_first_sq AS(
SELECT
  patientunitstayid
, bilirubin AS bilirubin_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_lab` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
),BUN_first_sq AS(
SELECT
  patientunitstayid
, BUN AS BUN_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_lab` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), wbc_first_sq AS(
SELECT
  patientunitstayid
, wbc AS wbc_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_lab` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), platelets_first_sq AS(
SELECT
  patientunitstayid
, platelets AS platelets_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_lab` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), hematocrit_first_sq AS(
SELECT
  patientunitstayid
, hematocrit AS hematocrit_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_lab` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), baseexcees_first_sq AS(
SELECT
  patientunitstayid
, hemoglobin AS hemoglobin_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_lab` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
), glucose_first_sq AS(
SELECT
  patientunitstayid
, glucose AS glucose_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_lab` 
WHERE chartoffset BETWEEN -6*24 AND 24*60  
)
SELECT patientunitstayid
,albumin_first
,bilirubin_first
,BUN_first
,wbc_first
,platelets_first
,hematocrit_first
,hemoglobin_first
,glucose_first
FROM unique_icustays
LEFT JOIN
albumin_first_sq
USING
(patientunitstayid)
LEFT JOIN
bilirubin_first_sq
USING
(patientunitstayid)
LEFT JOIN
BUN_first_sq
USING
(patientunitstayid)
LEFT JOIN
wbc_first_sq
USING
(patientunitstayid)
LEFT JOIN
platelets_first_sq
USING
(patientunitstayid)
LEFT JOIN
hematocrit_first_sq
USING
(patientunitstayid)
LEFT JOIN
baseexcees_first_sq
USING
(patientunitstayid)
LEFT JOIN
glucose_first_sq
USING
(patientunitstayid)
WHERE
    albumin_first_sq.rn = 1
AND bilirubin_first_sq.rn = 1
AND BUN_first_sq.rn = 1
AND wbc_first_sq.rn = 1
AND platelets_first_sq.rn = 1
AND hematocrit_first_sq.rn = 1
AND baseexcees_first_sq.rn = 1
AND glucose_first_sq.rn = 1
