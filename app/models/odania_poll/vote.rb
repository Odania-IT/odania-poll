class OdaniaPoll::Vote < ActiveRecord::Base
	belongs_to :user, class_name: 'Odania::User'
	belongs_to :answer, class_name: 'OdaniaPoll::Answer'
end
