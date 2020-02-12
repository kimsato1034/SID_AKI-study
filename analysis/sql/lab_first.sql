-- This query extracts Lab analysis data 
-- At admission (the first available data -6 hours prior to ICU adm or 24 hours after)  

WITH lab_first_sq AS(
SELECT
  patientunitstayid
,albumin AS albumin_first
,bilirubin AS bilirubin_first
,BUN AS BUN_first
,wbc AS wbc_first
,platelets AS platelets_first
,hematocrit AS hematocrit_first
,hemoglobin AS hemoglobin_first
,glucose AS glucose_first
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM `physionet-data.eicu_crd_derived.pivoted_lab`
WHERE chartoffset BETWEEN -6*60 AND 24*60
AND 
    albumin IS NOT NULL
AND bilirubin IS NOT NULL
AND BUN IS NOT NULL
AND wbc IS NOT NULL
AND platelets IS NOT NULL
AND hematocrit IS NOT NULL
AND hemoglobin IS NOT NULL
AND glucose IS NOT NULL
)
SELECT 
 patientunitstayid
,albumin_first
,bilirubin_first
,BUN_first
,wbc_first
,platelets_first
,hematocrit_first
,hemoglobin_first
,glucose_first
FROM lab_first_sq
WHERE rn = 1
