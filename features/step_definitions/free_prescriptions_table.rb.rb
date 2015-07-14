And(/^the user is (.*) years old$/) do |age|
  @person.age = age.to_i
end


And(/^the user has these (.*)$/) do |certificates|
  certificates = certificates.split ' '
  certificates.each { |c| @person.certificates[c.to_sym] = true }
end


And(/^their SIP total is (.*)$/) do |sip_total|
  @person.sip_total = sip_total.to_i
end

Then(/^the prescription cost should be normal$/) do
  expect(@person.prescription_cost).to eql(8.50)
end
