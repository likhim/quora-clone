class CreateQuestions < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.belongs_to :user, index: true
			t.text :description
			t.timestamps
		end
	end
end