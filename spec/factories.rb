FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
  end

  factory :consultant do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    factory :consultant_with_company do
      company
    end
  end

  factory :job do
    name { Faker::Job.title }
    closing_date { 3.days.from_now }
    paid_for_posting_until { 17.days.from_now }
    published_at { Date.today }
    association :consultant, factory: :consultant_with_company
    association :company, factory: :company
  end
end
