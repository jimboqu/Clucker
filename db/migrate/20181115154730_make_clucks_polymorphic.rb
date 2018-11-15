class MakeClucksPolymorphic < ActiveRecord::Migration[5.1]
  class Cluck < ApplicationRecord
    belongs_to :content, polymorphic: true
  end
  class TextCluck < ApplicationRecord; end
  #these are reference so the actual models are not reached and affect the update.
  def change
  	change_table(:clucks) do |t|
      t.string :content_type
      t.integer :content_id
      t.index [:content_type, :content_id]
  	end
    reversible do |dir|
      Cluck.reset_column_information
      Cluck.find_each do |cluck|
      	dir.up do
          text_cluck = Textcluck.create(body: cluck.body)
          cluck.update(content_id: text_cluck.id, content_type: 'Textcluck')
  	    end
  	    dir.down do 
          cluck.update(body: cluck.content.body)
          cluck.content.destroy
  	    end
      end
       
    end


  	remove_column :clucks, :body, :string
  end
end
