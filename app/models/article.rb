class Article < ApplicationRecord
  # normal way to change url like friendly id
  # def to_param
  #   "#{id} #{title}".parameterize
  # end

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    # new_record?
    regenerated_keys = %w(title)
    slug.blank? || (self.changes.keys & regenerated_keys).present?
  end
end
