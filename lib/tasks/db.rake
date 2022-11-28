namespace :db do
  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do
    5.times do
      Company.create!(
        name: Faker::Company.name,
        workflow_state: 'draft',
        description: Faker::Company.catch_phrase,
        website: Faker::Internet.url
      )
    end

    5.times do
      Company.create!(
        name: Faker::Company.name,
        workflow_state: 'processed',
        description: Faker::Company.catch_phrase,
        website: Faker::Internet.url
      )
    end

    puts "#{Company.all.size} companies created"

    3.times do
      Consultant.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        company_id: Company.find(6).id,
        title: 'Manager',
        experience_duration: 5
      )
    end

    3.times do
      Consultant.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        company_id: Company.find(8).id,
        title: 'Manager',
        experience_duration: 5
      )
    end

    puts "#{Consultant.all.size} consultants created"

    company_1 = Company.find(8)
    consultant_1 = Consultant.find(5)

    10.times do
      Job.create!(
        name: Faker::Job.title,
        job_type: 1,
        closing_date: 1.year.from_now,
        description: 'A very cool job position',
        paid_for_posting_until: 1.year.from_now,
        published_at: 1.month.ago,
        workflow_state: 'published',
        company_id: company_1.id,
        consultant_id: consultant_1.id
      )
    end

    company_2 = Company.find(6)
    consultant_2 = Consultant.find(3)

    10.times do
      Job.create!(
        name: Faker::Job.title,
        job_type: 1,
        closing_date: 1.year.from_now,
        description: 'A very cool job position',
        paid_for_posting_until: 1.day.ago,
        published_at: 1.month.ago,
        workflow_state: 'published',
        company_id: company_2.id,
        consultant_id: consultant_2.id
      )
    end

    puts "#{Job.all.size} jobs created"
  end
end
