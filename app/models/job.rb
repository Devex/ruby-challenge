# == Schema Information
#
# Table name: jobs
#
#  id                         :integer          not null, primary key
#  name                       :string           not null
#  publish_status_id          :integer          not null
#  is_featured                :boolean          default(FALSE)
#  is_remote                  :boolean          default(FALSE)
#  job_type                   :integer
#  closing_date               :date
#  description                :text
#  organization_name          :string
#  paid_for_posting_until     :date
#  permalink                  :string
#  published_at               :date
#  salary_information_display :boolean          default(FALSE), not null
#  salary_range_bottom        :integer
#  salary_range_top           :integer
#  salary_range_currency_id   :integer
#  workflow_state             :string
#  career_level_id            :integer
#  company_id                 :integer
#  employer_company_id        :integer
#  consultant_id              :integer
#  contract_length_id         :integer
#  last_updated_by_id         :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
class Job < ApplicationRecord
  CAREER_LEVELS = ['Scholarships / Fellowships',
                   'Entry-level',
                   'Mid-level',
                   'Senior-level',
                   'Executive-level',
                   'Volunteer',
                   'Internship']

  CONTRACT_LENGTHS = ['All',
                      'Full-time staff position',
                      'Part-time staff position',
                      'Volunteer opportunity',
                      'Field assignment',
                      'None',
                      'Short-term contract assignment',
                      'Long-term consulting assignment']

  belongs_to :consultant

  belongs_to :company
  alias_method :poster_company, :company
  belongs_to :employer_company, class_name: 'Company'

  belongs_to :last_updated_by, class_name: 'Consultant'
end
