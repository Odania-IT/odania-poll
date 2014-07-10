class OdaniaPoll::Poll < ActiveRecord::Base
	belongs_to :user, class_name: 'Odania::User'
	has_many :answers, class_name: 'OdaniaPoll::Answer'
	has_many :votes, class_name: 'OdaniaPoll::Votes'

	accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['answer'].blank? }
end
