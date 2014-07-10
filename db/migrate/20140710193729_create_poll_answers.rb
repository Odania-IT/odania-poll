class CreatePollAnswers < ActiveRecord::Migration
	def change
		create_table :odania_poll_answers do |t|
			t.references :poll, index: true
			t.text :answer
			t.timestamps
		end
	end
end
