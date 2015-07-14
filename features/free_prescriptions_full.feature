Feature: free prescriptions
  As a receiver of prescriptions
  I want to know that the charges are correct
  So that I am not overcharged for my prescription

  Scenario: Older user
    Given a user is dispensed a prescription
    When their age is >= 60
    Then the prescription cost should be 0

  Scenario: Younger user
    Given a user is dispensed a prescription
    And their age is < 16
    Then the prescription cost should be 0

  Scenario: Student
    Given a user is dispensed a prescription
    When their age is >= 16 and <= 18
    And they are in full-time education
    Then the prescription cost should be 0

  Scenario: Pregnant user
    Given a user is dispensed a prescription
    When they are pregnant
    And they have a valid MedEx certificate
    Then the prescription cost should be 0

  Scenario: Recent mother
    Given a user is dispensed a prescription
    When they have had a baby in the past 12 months
    And they have a valid MedEx certificate
    Then the prescription cost should be 0

  Scenario: Certified medical condition
    Given a user is dispensed a prescription
    When they have a specified medical condition
    And they have a valid MedEx certificate
    Then the prescription cost should be 0

  Scenario: Younger user
    Given a user is dispensed a prescription
    When they have a continuing physical disability that prevents them from going out without help from another person
    And they have a valid MedEx certificate
    Then the prescription cost should be 0

  Scenario: War pension / accepted disability
    Given a user is dispensed a prescription
    When they have a War Pension exemption certificate
    And the prescription is for their accepted disability
    Then the prescription cost should be 0

  Scenario: Inpatient
    Given a user is dispensed a prescription
    When they are an inpatient
    Then the prescription cost should be 0

  Scenario: NHS tax credit exemption cert
    Given a user is dispensed a prescription
    When they or their partner have an NHS tax credit exemption certificate
    Then the prescription cost should be 0

  Scenario: HC2 cert
    Given a user is dispensed a prescription
    When they or their partner have a valid HC2 certificate
    Then the prescription cost should be 0

  Scenario: Income support
    Given a user is dispensed a prescription
    When they or their partner receive the "Income Support" benefit
    Then the prescription cost should be 0

  Scenario: Jobseeker's allowance
    Given a user is dispensed a prescription
    When they or their partner receive the "Income-based Jobseeker's Allowance" benefit
    Then the prescription cost should be 0

  Scenario: Income-related employment and support allowance
    Given a user is dispensed a prescription
    When they or their partner receive the "Income-related Employment and Support Allowance" benefit
    Then the prescription cost should be 0

  Scenario: Pension credit guarantee credit
    Given a user is dispensed a prescription
    When they or their partner receive the "Pension Credit Guarantee Credit" benefit
    Then the prescription cost should be 0

  Scenario: Universal credit
    Given a user is dispensed a prescription
    When they or their partner receive the "Universal Credit" benefit
    Then the prescription cost should be 0

  Scenario: Care home user (means-tested)
    Given a user is dispensed a prescription
    When they live permanently in a care home
    And hold savings, investments or property (not counting the place where they live) of £23250 or less
    And their income is <= their requirements, or greater by no more than half the current English prescription charge
    Then the prescription cost should be 0

  Scenario: Not a permanent care home user (means-tested)
    Given a user is dispensed a prescription
    When they do not live permanently in a care home
    And hold savings, investments or property (not counting the place where they live) of £16000 or less
    And their income is <= their requirements, or greater by no more than half the current English prescription charge
    Then the prescription cost should be 0
