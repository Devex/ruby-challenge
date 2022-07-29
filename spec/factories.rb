FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "#{Faker::Company.name} #{n}" }
  end

  factory :consultant do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    factory :consultant_with_company do
      company
    end
  end

  factory :job do
    sequence(:name) { |n| "#{Faker::Job.title} #{n}" }
    publish_status_id { 1 }
    closing_date { 3.days.from_now }
    paid_for_posting_until { 17.days.from_now }
    published_at { Date.today }
    consultant
    organization_name { Faker::Company.name }

    factory :job_employer_company do
      association :employer_company, factory: :company
    end
  end
end
