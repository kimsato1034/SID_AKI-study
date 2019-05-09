-- This query extracts lab data 
-- The first available data 24 hours prior to admission.

SELECT patientunitstayid, chartoffset, albumin, bilirubin, BUN, calcium, 
creatinine, glucose, bicarbonate, TotalCO2, hematocrit, hemoglobin, 
INR, lactate, platelets, potassium, ptt, sodium, wbc, bands, alt, ast, alp 
FROM `physionet-data.eicu_crd_derived.pivoted_lab`
WHERE chartoffset <=0 