class OdaniaPoll::Votes < ActiveRecord::Base
	belongs_to :user
	belongs_to :token
	belongs_to :answer
end
