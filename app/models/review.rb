class Review < ActiveRecord::Base
  belongs_to :city

  before_create :add_root_to_external_link, :sanitize_title, :sanitize_data

  private

  def sanitize_title
    self.title = self.title.delete("\n")
  end

  def sanitize_data
    self.data.delete_if {|key,value| value == nil || value.length == 0 }

    self.data.each do |key, value|
      if value.class == Hash
        value.delete_if {|k,val| value == nil || value.length == 0 }
      end
    end
  end

  def add_root_to_external_link
    self.link = "http://tripadvisor.com" + self.link
  end

end
