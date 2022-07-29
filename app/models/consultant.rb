# == Schema Information
#
# Table name: consultants
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  company_id           :integer
#  headline             :string
#  is_public            :boolean          default(TRUE), not null
#  is_featured          :boolean          default(FALSE)
#  title                :string
#  birth_date           :date
#  available_from       :date
#  data_completeness    :integer
#  experience_duration  :integer
#  last_login_at        :date
#  last_profile_update  :date
#  specialties          :text
#  employment_status_id :integer
#  career_level_id      :integer
#  contract_length_id   :integer
#  who_am_i             :text
#  zip_code             :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Consultant < ApplicationRecord
  belongs_to :company
  delegate :name, to: :company, prefix: true, allow_nil: true
  has_many :posted_jobs, class_name: 'Job', dependent: :nullify
end
