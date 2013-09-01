class Review < ActiveRecord::Base
  belongs_to :city

  before_create :add_root_to_external_link, :sanitize_title

  private

  def sanitize_title
    self.title = self.title.delete("\n")
  end

  def add_root_to_external_link
    self.link = "http://tripadvisor.com" + self.link
  end
end
