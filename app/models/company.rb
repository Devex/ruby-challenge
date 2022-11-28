# == Schema Information
#
# Table name: companies
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  short_name        :string
#  website           :string
#  description       :text
#  short_description :string
#  workflow_state    :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Company < ApplicationRecord
  WORKFLOW_STATES = {
    processed: 'processed',
    unprocessed: 'unprocessed',
    deactivated: 'deactivated',
    draft: 'draft',
    viewonly: 'viewonly',
    duplicate: 'duplicate',
  }

  validates :name, presence: true
  validates :name, uniqueness: true, on: :create
end
