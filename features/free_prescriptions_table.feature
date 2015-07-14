Feature: free prescriptions (table-based)
  As a receiver of prescriptions
  I want to know that the charges are correct
  So that I am not overcharged for my prescription

  Scenario Outline: dispensing a prescription
    Given a user is dispensed a prescription
    And the user is <age> years old
    And the user has these <certificates>
    And the user has these <circumstances>
    And their SIP total is <sip_total>
    Then the prescription cost should be <cost>

    Examples:
      | age   | certificates             | circumstances                           | sip_total |    cost |
      |  16   |                          |                                         |           |  normal |
      |  15   |                          |                                         |           |       0 |
      |  16   |                          | full_time_education                     |           |       0 |
      |  17   |                          | full_time_education                     |           |       0 |
      |  18   |                          | full_time_education                     |           |       0 |
      |  18   |                          |                                         |           |  normal |
      |  25   |                          | inpatient                               |           |       0 |
      |  25   |                          |                                         |           |  normal |
      |  25   | medex                    | pregnant                                |           |       0 |
      |  25   |                          | pregnant                                |           |  normal |
      |  25   | medex                    | baby_in_last_12_months                  |           |       0 |
      |  25   |                          | baby_in_last_12_months                  |           |  normal |
      |  25   | medex                    | specified_medical_condition             |           |       0 |
      |  25   | medex                    | physical_disability_prevents_going_out_without_help |  0 |  0 |
      |  25   | nhs_tax_credit_exemption |                                         |         0 |       0 |
      |  25   | hc2                      |                                         |         0 |       0 |
      |  25   |                          | income_support_benefit                  |         0 |       0 |
      |  25   |                          | jobseekers_allowance_benefit            |         0 |       0 |
      |  25   |                          | employment_and_support_allowance_benefit|         0 |       0 |
      |  25   |                          | pension_credit_guarantee_benefit        |         0 |       0 |
      |  25   |                          | universal_credit_benefit                |         0 |       0 |
      |  25   |                          | permanent_care_home_resident income_qualifies|23250 |       0 |
      |  25   |                          | permanent_care_home_resident income_qualifies|23251 |  normal |
      |  25   |                          | income_qualifies                        |     23250 |       0 |
      |  25   |                          | income_qualifies                        |     23251 |  normal |
      |  59   |                          |                                         |         0 |  normal |
      |  59   | war_pension_exemption    | prescription_for_accepted_disability    |         0 |       0 |
      |  60   |                          |                                         |         0 |       0 |
