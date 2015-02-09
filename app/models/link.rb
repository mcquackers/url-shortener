class Link < ActiveRecord::Base
  belongs_to :user

  after_save :generate_slug

  private

  def generate_slug
    unless slug
      slug = id.to_s(36)
    end
  end
end
