class Person
  attr_accessor :age, :full_time_education, :pregnant,
                :had_baby_in_last_12_months, :specified_medical_condition,
                :physical_disability_prevents_going_out_without_help,
                :prescription_for_accepted_disability,
                :inpatient, :permanent_care_home_resident, :sip_total,
                :income_qualifies

  def benefits
    # Benefits default to false unless we say otherwise
    @_benefits ||= Hash.new { |hash, key| hash[key] = false }
  end

  def certificates
    # Certificates default to false unless we say otherwise
    @_certificates ||= Hash.new { |hash, key| hash[key] = false }
  end

  def prescription_cost
    0
  end
end
