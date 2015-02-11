class Link < ActiveRecord::Base
  validate :is_a_valid_url

  belongs_to :user
  has_many :clicks
  has_one :info_record

  after_create :generate_slug
  after_create :generate_info_record

  private

  def is_a_valid_url
    http_request = Net::HTTP.new(url)
    begin
      http_response = http_request.request_get("/")
      puts http_response.code
      http_response.code == "200"
    rescue
      errors.add(:url, "Must be a valid non-directing URL")
    end
  end

  def generate_slug
    self.slug = self.id.to_s(36)
    self.save
  end

  def generate_info_record
    self.info_record = InfoRecord.create(
      user_id: self.user_id,
      link_id: self.id,
      url: self.url,
      slug: self.slug,
      disabled: self.disabled
      )
  end
end
