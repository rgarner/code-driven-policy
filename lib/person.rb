class Person
  attr_accessor :age, :full_time_education, :pregnant, :valid_medex,
                :had_baby_in_last_12_months, :specified_medical_condition,
                :physical_disability_prevents_going_out_without_help,
                :war_pension_exemption_certificate,
                :prescription_for_accepted_disability,
                :inpatient, :permanent_care_home_resident,
                :nhs_tax_credit_exemption_certificate,
                :valid_hc2_certificate, :sip_total,
                :income_qualifies

  def benefits
    # Benefits default to false unless we say otherwise
    @_benefits ||= Hash.new { |hash, key| hash[key] = false }
  end

  def prescription_cost
    0
  end
end
