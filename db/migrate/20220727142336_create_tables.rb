class CreateTables < ActiveRecord::Migration[7.0]
  def up
    create_table :companies do |t|
      t.string :name, null:false, index: true
      t.string :short_name, index: true
      t.string :website
      t.text :description
      t.string :short_description
      t.string :workflow_state, index: true

      t.timestamps
    end

    create_table :consultants do |t|
      t.string :first_name
      t.string :last_name
      t.references :company, index: true
      t.string :headline
      t.boolean :is_public, default: true, null: false, index: true
      t.boolean :is_featured, default: false
      t.string :title
      t.date :birth_date
      t.date :available_from
      t.integer :data_completeness
      t.integer :experience_duration
      t.date :last_login_at
      t.date :last_profile_update
      t.text :specialties
      t.text :who_am_i

      t.timestamps
    end

    create_table :jobs do |t|
      t.string :name, null: false
      t.boolean :is_featured, default: false
      t.boolean :is_remote, default: false
      t.integer :job_type
      t.date :closing_date
      t.text :description
      t.date :paid_for_posting_until
      t.date :published_at
      t.boolean :salary_information_display, default: false, null: FALSE
      t.integer :salary_range_bottom
      t.integer :salary_range_top
      t.string :workflow_state
      t.references :company, index: true
      t.references :consultant, index: true

      t.timestamps
    end
  end

  def down
    drop_table :jobs
    drop_table :consultants
    drop_table :companies
  end
end
