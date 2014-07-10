class OdaniaPoll::Answer < ActiveRecord::Base
	belongs_to :poll, class_name: 'OdaniaPoll::Poll'
	has_many :votes, class_name: 'OdaniaPoll::Vote'
end
