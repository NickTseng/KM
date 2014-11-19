class Post < ActiveRecord::Base
  acts_as_taggable
  has_many :impressions

  def impression_count
    impressions.size
  end

  def unique_impression_count
    impressions.group(:ip_address).size
  end

end
