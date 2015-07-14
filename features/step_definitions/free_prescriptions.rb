Given(/^a user is dispensed a prescription$/) do
  @person = Person.new
end

When(/^their age is >= (\d+)$/) do |age|
  @person.age = age.to_i + 1
end

Then(/^the prescription cost should be (\d+)$/) do |expected_cost|
  puts @person.inspect
  expect(@person.prescription_cost).to eql(expected_cost.to_i)
end

And(/^their age is < (\d+)$/) do |age|
  @person.age = age.to_i - 1
end

When(/^their age is >= (\d+) and <= (\d+)$/) do |lower, upper|
  upper, lower = upper.to_i, lower.to_i
  raise ArgumentError, 'lower should be less than upper and at least 2 apart' unless lower < upper && upper - lower >= 2

  @person.age = lower + 1
end

And(/^they are in full\-time education$/) do
  @person.full_time_education = true
end

When(/^they are pregnant$/) do
  @person.pregnant = true
end

And(/^they have a valid MedEx certificate$/) do
  @person.valid_medex = true
end

When(/^they have had a baby in the past (\d+) months$/) do |arg|
  @person.had_baby_in_last_12_months = true
end

When(/^they have a specified medical condition$/) do
  @person.specified_medical_condition = true
end

When(/^they have a continuing physical disability that prevents them from going out without help from another person$/) do
  @person.physical_disability_prevents_going_out_without_help
end

When(/^they have a War Pension exemption certificate$/) do
  @person.war_pension_exemption_certificate = true
end

And(/^the prescription is for their accepted disability$/) do
  @person.prescription_for_accepted_disability = true
end

When(/^they are an inpatient$/) do
  @person.inpatient = true
end

When(/^they or their partner have an NHS tax credit exemption certificate$/) do
  @person.nhs_tax_credit_exemption_certificate
end

When(/^they or their partner have a valid HC2 certificate$/) do
  @person.valid_hc2_certificate
end

When(/^they or their partner receive the "([^"]*)" benefit$/) do |benefit_name|
  @person.benefits[benefit_name] = true
end

When(/^they live permanently in a care home$/) do
  @person.permanent_care_home_resident = true
end

And(/^hold savings, investments or property \(not counting the place where they live\) of £(\d+) or less$/) do |amount|
  @person.sip_total = amount
end

And(/^their income is <= their requirements, or greater by no more than half the current English prescription charge$/) do
  @person.income_qualifies = true
end

When(/^they do not live permanently in a care home$/) do
  @person.permanent_care_home_resident = false
end
