-- This query extracts Blood gas analysis data 
-- The first available data 24 hours prior to admission.

SELECT patientunitstayid, chartoffset, fio2, pao2, paco2, pH, aniongap, basedeficit, baseexcess, peep FROM `physionet-data.eicu_crd_derived.pivoted_bg` 
WHERE chartoffset <=0 