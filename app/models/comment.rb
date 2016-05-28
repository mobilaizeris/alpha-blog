class Comment < ActiveRecord::Base
	belongs_to :article
	belongs_to :user
	validates :description,presence: true, length: { minimum: 3, maximum: 100}
end