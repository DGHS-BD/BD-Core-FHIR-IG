Invariant: bd-loinc-code
Description: "The code SHALL include at least one coding from LOINC (http://loinc.org)."
Severity: #error
Expression: "coding.where(system = 'http://loinc.org').exists()"
XPath: "exists(f:coding[f:system/@value='http://loinc.org'])"
