# SID_AKI-study

Code repository for the project _[“Association of Chloride Ion and Sodium-Chloride Difference With Acute Kidney Injury and Mortality in Critically Ill Patients”.](https://journals.lww.com/ccejournal/Fulltext/2020/12000/Association_of_Chloride_Ion_and_Sodium_Chloride.5.aspx)_

# Inclusion criteria
First admission to ICU  
18 years old or older  

Data extraction
※The day of ICU admission is “ICU day 0”

# Blood gas analysis

Chloride, Sodium, Potassium, Calcium, Magnesium, Lactate, pCO2, Bicarbonate, Base excess, Phosphate,
pH, pO2.

- [x] At admission (the first available data 24 hours prior to, or 6 hours after, ICU admission).
- [x] Maximum value, minimum value for 24 hours after ICU admission.
- [x] Maximum value, minimum value for 48 hours after ICU admission.
- time-weighted mean for 24 hours.   
- time-weighted mean for 48 hours after ICU admission.

## SID (Sodium minus chloride: for this calculation, these ions need to be measured at the same time)
- [x] At admission (the first available data 24 hours prior to, or 6 hours after, ICU admission).
- [x] Maximum value, minimum value for 24 hours after ICU admission.  
- [x] Maximum value, minimum value for 48 hours after ICU admission.  
- time-weighted mean for 24 hours.  
- time-weighted mean for 48 hours after ICU admission.

# Lab data

Chloride, Sodium, Potassium, Calcium, Magnesium, Lactate, pCO2, Bicarbonate, Base excess, Phosphate,
pH, pO2, SID (=Sodium minus chloride: for this calculation, these ions need to be measured at the same
time)
- [x] At admission (the first available data 24 hours prior to, or 6 hours after, ICU admission).
- [x] Maximum value, minimum value for 24 hours after ICU admission.
- [x] Maximum value, minimum value for 48 hours after ICU admission.
- time-weighted mean for 24 hours 
- time-weighted mean for 48 hours after ICU admission.

# Kidney function
- [x] Creatinine: Baseline (within three months before admission) (if no record, it’s missing value) 
- [x] Creatinine: At admission (the first available creatinine 24 hours prior to, or 6 hours after, ICU admission) 
- Creatinine: ICU day0, day1, day2, day3, day4, day5, day6, day7 (maximum value on each day) . 

# Lab data (maximum and minimum) within the first 24 hours and within 48 hours after ICU admission

- [x] Glucose Level (mg/dL)   
- [x] Hemoglobin Level (g/dL)   
- [x] Hematocrit (%)    
- [x] Platelet Count (K/μL)   
- [x] Blood Urea Nitrogen Level (mg/dL)   
- [x] White Blood Cell Count (K/μL)   
- [x] Albumin   
CRP _NOT FOUND_  
- [x] Bilirubin   

# Vital sign and others: within the first 24 hours after ICU admission
- [x] Heart Rate Maximum (bpm) 
- [x] Heart Rate Mean (bpm) 
- [x] Systolic BP Minimum (mmHg) 
- [x] Systolic BP Mean (mmHg) 
- [x] Diastolic BP Minimum (mmHg) 
- [x] Diastolic BP Mean (mmHg) 
- [x] Temperature Maximum (Celsius) 
SpO2 Minimum (%)  
SpO2 Mean (%)  
Respiratory rate Maximum (/min)  
- [x] Urine output (ml)  
Fluid intake (ml)  
Vasopressors (Noradrenaline, adrenaline, vasopressin, dobutamine, and dopamine) (0 or 1, respectively)  

# Vital sign and others: within the first 48 hours after ICU admission
- [x] Heart Rate Maximum (bpm) 
- [x] Heart Rate Mean (bpm) 
- [x] Systolic BP Minimum (mmHg) 
- [x] Systolic BP Mean (mmHg) 
- [x] Diastolic BP Minimum (mmHg) 
- [x] Diastolic BP Mean (mmHg) 
- [x] Temperature Maximum (Celsius) 
SpO2 Minimum (%)  

SpO2 Mean (%)  
Respiratory rate Maximum (/min)  
- [x] Urine output (ml)  
Fluid intake (ml)  
Vasopressors (Noradrenaline, adrenaline, vasopressin, dobutamine, and dopamine) (0 or 1, respectively)  

# Other covariates
- [x] Gender  
- [x] Age  
- [x] Weight
- [x] height
- [x] BMI
- [x] BMI Group
- [x] Ethnicity  
- [x] ICU type: medical ICU, cardiac ICU, or surgical ICU  
- [x] Mechanical Ventilation in the first 24 hours after ICU admission (0 or 1)  
- [x] Mechanical Ventilation 48 hours after ICU admission (0 or 1) 
- [x] Surgical patient or not (0 or 1) before ICU admission; if so, type of surgery  
- [x] Admission type: emergency or not  
- [x] Main diagnosis for the admission  
Sepsis (0 or 1)  
Burn (0 or 1)  
Trauma (0 or 1)  
Pre-ICU length of stay in hospital (days)  

# Outcomes
AKI (0 or 1) and the stage (1, 2, or 3) (using KDIGO criteria based on creatinine, urine output, and renal  
replacement therapy): within 7 days after ICU admission and the date of the development of AKI (ex.ICU day2 etc)  
ICU mortality (0 or 1)  
- [x] Hospital mortality (0 or 1)  
- [x] Length of stay in ICU  
- [x] Length of stay in hospital  
- [x] Length of mechanical ventilation  
Length of renal replacement therapy  

# Medication (Before or at the time of admission)
Diuretic (0 or 1)  
ACE-I (0 or 1)  
ARB (0 or 1)  
Calcium channel blocker (0 or 1)  
β blocker (0 or 1)  

# Severity score (ICU day 0 and ICU day 1)  
SOFA  
APACHE III  

# Past medical history
- [x] Congestive heart failure  
- [x] Peripheral vascular disease  
- [x] Hypertension  
- [x] Chronic pulmonary disease  
- [x] Diabetes mellitus  
- [x] Chronic liver disease  
- [x] Malignancy  

[![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.18914.svg)](https://doi.org/10.1097/cce.0000000000000247)  
[![forthebadge made-with-python](http://ForTheBadge.com/images/badges/made-with-python.svg)](https://www.python.org/)  
[![Made withJupyter](https://img.shields.io/badge/Made%20with-Jupyter-orange?style=for-the-badge&logo=Jupyter)](https://jupyter.org/try)  
