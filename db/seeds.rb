# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
5.times do
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

3.times do
  Consultant.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_id: Company.find(6).id,
    title: 'Manager',
    experience_duration: 5
  )

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
