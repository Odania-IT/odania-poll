class OdaniaPoll::Answer < ActiveRecord::Base
	belongs_to :poll
end
