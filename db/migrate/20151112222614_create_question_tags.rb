class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.references :question, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
