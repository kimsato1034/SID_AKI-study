SELECT patientunitstayid
, SUM(CASE WHEN chartoffset between -6*60 AND 24*60 AND urineoutput IS NOT NULL THEN urineoutput END) AS urineoutput_total_24
, SUM(CASE WHEN chartoffset between -6*60 AND 48*60 AND urineoutput IS NOT NULL THEN urineoutput END) AS urineoutput_total_48
FROM `physionet-data.eicu_crd_derived.pivoted_uo`
GROUP BY patientunitstayid