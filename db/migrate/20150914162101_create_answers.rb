class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.belongs_to :user
      t.belongs_to :question

      t.timestamps
    end
  end
end
