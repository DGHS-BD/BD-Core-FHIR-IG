# Changelog


## [0.2.0] – 2025-10-02  
**First official draft release of BD-Core-FHIR-IG**

### Added
- **BDPatientProfile** with Bangladesh-specific identifier and address extensions.  
- **BDPractitionerProfile** to capture practitioner details.  
- **Identifier CodeSystem and ValueSet** including:  
  - National ID (NID)  
  - Birth Registration Number (BRN)  
  - Unique Health ID (UHID)   
- **Bangladesh Address profile** with Division, District, Upazila, and Union levels.  
- Initial **examples** for Patient and Practitioner resources.  
- Configured **bd.fhir.core.xml** with canonical URL `https://fhir.dghs.gov.bd`.  

### Notes
- This is a **pre-release draft** (`0.x.x` series).  
- Backward compatibility is **not guaranteed** until `1.0.0`.  
- Future drafts may adjust slicing rules, bindings, and extensions.

---
