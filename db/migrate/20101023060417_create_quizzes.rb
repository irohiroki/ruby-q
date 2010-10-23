class CreateQuizzes < ActiveRecord::Migration
  def self.up
    create_table :quizzes do |t|
      t.text :question
      t.string :answer
      t.string :ruby_version

      t.timestamps
    end
  end

  def self.down
    drop_table :quizzes
  end
end
