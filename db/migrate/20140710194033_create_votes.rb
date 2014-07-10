class CreateVotes < ActiveRecord::Migration
	def change
		create_table :odania_poll_votes do |t|
			t.references :poll, index: true
			t.references :user, index: true
			t.references :answer, index: true
			t.timestamps
		end
	end
end
