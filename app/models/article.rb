class Article < ActiveRecord::Base
  validates :header, :content, presence: true, length: { minimum: 10 }
  include Bootsy::Container
  before_save :get_title

 
  private
 
  def get_title
    self.title = header if title.empty?
  end


end