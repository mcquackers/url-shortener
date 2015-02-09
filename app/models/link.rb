class Link < ActiveRecord::Base
  after_save :generate_slug

  private

  def generate_slug
    unless self.slug
      self.slug = self.id.to_s(36)
    end
  end
end
