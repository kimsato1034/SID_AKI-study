-- Lab data (maximum and minimum) within the first 24 hours and within 48 hours after ICU admission
SELECT patientunitstayid
-- first 24 hrs
--  min
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND glucose IS NOT NULL THEN glucose END) AS glucose_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND hemoglobin IS NOT NULL THEN hemoglobin END) AS hemoglobin_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND hematocrit IS NOT NULL THEN hematocrit END) AS hematocrit_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND platelets IS NOT NULL THEN platelets END) AS platelets_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND BUN IS NOT NULL THEN BUN END) AS BUN_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND wbc IS NOT NULL THEN wbc END) AS wbc_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND albumin IS NOT NULL THEN albumin END) AS albumin_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND bilirubin IS NOT NULL THEN bilirubin END) AS bilirubin_min24
-- max
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND glucose IS NOT NULL THEN glucose END) AS glucose_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND hemoglobin IS NOT NULL THEN hemoglobin END) AS hemoglobin_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND hematocrit IS NOT NULL THEN hematocrit END) AS hematocrit_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND platelets IS NOT NULL THEN platelets END) AS platelets_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND BUN IS NOT NULL THEN BUN END) AS BUN_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND wbc IS NOT NULL THEN wbc END) AS wbc_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND albumin IS NOT NULL THEN albumin END) AS albumin_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND bilirubin IS NOT NULL THEN bilirubin END) AS bilirubin_min_48
-- first 48 hrs
--  min
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND glucose IS NOT NULL THEN glucose END) AS glucose_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND hemoglobin IS NOT NULL THEN hemoglobin END) AS hemoglobin_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND hematocrit IS NOT NULL THEN hematocrit END) AS hematocrit_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND platelets IS NOT NULL THEN platelets END) AS platelets_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND BUN IS NOT NULL THEN BUN END) AS BUN_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND wbc IS NOT NULL THEN wbc END) AS wbc_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND albumin IS NOT NULL THEN albumin END) AS albumin_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND bilirubin IS NOT NULL THEN bilirubin END) AS bilirubin_max24
--  max
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND glucose IS NOT NULL THEN glucose END) AS glucose_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND hemoglobin IS NOT NULL THEN hemoglobin END) AS hemoglobin_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND hematocrit IS NOT NULL THEN hematocrit END) AS hematocrit_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND platelets IS NOT NULL THEN platelets END) AS platelets_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND BUN IS NOT NULL THEN BUN END) AS BUN_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND wbc IS NOT NULL THEN wbc END) AS wbc_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND albumin IS NOT NULL THEN albumin END) AS albumin_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND bilirubin IS NOT NULL THEN bilirubin END) AS bilirubin_max_48
FROM `physionet-data.eicu_crd_derived.pivoted_lab`
GROUP BY patientunitstayid 