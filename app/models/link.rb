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
    # http_request.read_timeout = 10
    begin
      http_response = http_request.request_get("/")
      unless http_response.code == "200"
        errors.add(:url, "Must be a valid non-redirecting URL")
      end
    rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
      errors.add(:url, "The website did not respond")
    end
  end

  def generate_slug
    self.slug = self.id.to_s(36)
    self.save
  end

  def generate_info_record
    self.info_record = InfoRecord.create(
      user_id: user_id,
      link_id: id,
      url: url,
      slug: slug,
      disabled: disabled
      )
  end
end
