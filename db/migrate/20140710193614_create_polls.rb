class CreatePolls < ActiveRecord::Migration
	def change
		create_table :odania_poll_polls do |t|
			t.references :user, index: true
			t.text :question
			t.date :due_date
			t.timestamps
		end
	end
end
