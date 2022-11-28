# == Schema Information
#
# Table name: jobs
#
#  id                         :integer          not null, primary key
#  name                       :string           not null
#  is_featured                :boolean          default(FALSE)
#  is_remote                  :boolean          default(FALSE)
#  job_type                   :integer
#  closing_date               :date
#  description                :text
#  paid_for_posting_until     :date
#  published_at               :date
#  salary_information_display :boolean          default(FALSE), not null
#  salary_range_bottom        :integer
#  salary_range_top           :integer
#  workflow_state             :string
#  company_id                 :integer
#  consultant_id              :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
class Job < ApplicationRecord
  belongs_to :consultant
  belongs_to :company
end
