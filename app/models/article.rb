
class Article < ActiveRecord::Base
#	belongs_to :user
#	default_scope -> { order('created_at DESC') }
	validates :title, presence: true, length: { minimum: 10 }
	validates :content, presence: true, length: { minimum: 10 }
#	validates :user_id, presence: true
	include Bootsy::Container
end
