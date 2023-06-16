class CreateRepos < ActiveRecord::Migration[7.0]
  def change
    create_table :repos do |t|
      t.string :name
      t.string :summary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
