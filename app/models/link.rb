class Link < ActiveRecord::Base
  validate :is_a_valid_url

  belongs_to :user
  has_many :clicks
  has_one :info_record

  after_create :generate_slug

  private

  def is_a_valid_url
    http_request = Net::HTTP.new(url)
    begin
      http_response = http_request.request_get("/")
      http.response.is_a?(Net::HTTPSuccess) || http_response.code == "200"
    rescue ErrNo::ECONNREFUSED
      errors.add(:url, "Must be a valid non-directing URL")
    end
  end

  def generate_slug
    self.slug = self.id.to_s(36)
    self.save
  end
end
