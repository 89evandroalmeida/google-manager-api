class CreateInternalUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_users do |t|
      t.string :name
      t.string :api_key

      t.timestamps
    end
  end
end
