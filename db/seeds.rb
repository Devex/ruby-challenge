# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

3.times do
  Company.create!(
    name: Faker::Company.name,
    workflow_state: 'draft',
    description: Faker::Company.catch_phrase,
    website: Faker::Internet.url
  )

  Company.create!(
    name: Faker::Company.name,
    workflow_state: 'processed',
    description: Faker::Company.catch_phrase,
    website: Faker::Internet.url
  )
end

puts "#{Company.all.size} companies created"

company_1 = Company.where(workflow_state: 'processed').first
company_2 = Company.where(workflow_state: 'processed').second

3.times do
  Consultant.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_id: company_1.id,
    title: 'Manager',
    experience_duration: 5
  )

  Consultant.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_id: Company.second.id,
    title: 'Manager',
    experience_duration: 5
  )
end

puts "#{Consultant.all.size} consultants created"

consultant_1 = Consultant.first
consultant_2 = Consultant.second

12.times do
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

3.times do
  Job.create!(
    name: Faker::Job.title,
    job_type: 1,
    closing_date: 2.days.ago,
    description: 'A very cool job position',
    paid_for_posting_until: 2.days.ago,
    published_at: 2.months.ago,
    workflow_state: 'published',
    company_id: company_1.id,
    consultant_id: consultant_1.id
  )

  Job.create!(
    name: Faker::Job.title,
    job_type: 1,
    closing_date: 1.month.ago,
    description: 'A very cool job position',
    paid_for_posting_until: 1.month.ago,
    published_at: 6.months.ago,
    workflow_state: 'published',
    company_id: company_2.id,
    consultant_id: consultant_2.id
  )
end

puts "#{Job.all.size} jobs created"
