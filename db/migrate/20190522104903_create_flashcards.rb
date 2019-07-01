class CreateFlashcards < ActiveRecord::Migration[5.2]
  def change
    create_table :flashcards do |t|
      t.string :word
      t.text  :answer
      t.timestamps
    end
  end
end
