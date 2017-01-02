class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :primary_email
      t.string :full_name
      t.boolean :is_admin
      t.datetime :last_login_time
      t.datetime :creation_time
      t.boolean :suspended
      t.string :customer_id
      t.string :org_unit_path

      t.timestamps
    end
  end
end
