class Article < ActiveRecord::Base
#  belongs_to :user
#  default_scope -> { order('created_at DESC') }
  validates :header, :content, presence: true, length: { minimum: 10 }
#  validates :user_id, presence: true
  include Bootsy::Container
  before_save :get_title

 
  private
 
  def get_title
    self.title = header if title.empty?
  end


end