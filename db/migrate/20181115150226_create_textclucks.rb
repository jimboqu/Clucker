class CreateTextclucks < ActiveRecord::Migration[5.1]
  def change
    create_table :textclucks do |t|
      t.string :body

      t.timestamps
    end
  end
end
