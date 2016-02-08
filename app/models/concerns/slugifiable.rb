class ActiveRecord::Base

  def to_slug
    self.name.downcase.gsub(" ","-")
  end

end