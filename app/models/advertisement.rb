# == Schema Information
#
# Table name: advertisements
#
#  id          :uuid             not null, primary key
#  status      :integer          default("inactive"), not null
#  type        :string           default("site_wide"), not null
#  url         :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :uuid             not null
#  category_id :uuid
#
# Indexes
#
#  index_advertisements_on_author_id    (author_id)
#  index_advertisements_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (category_id => categories.id)
#
class Advertisement < ApplicationRecord
  PROTOCOLS = %w[http https].freeze

  belongs_to :category
  belongs_to :author, class_name: 'User'

  enum status: { inactive: 0, active: 1 }

  validates :url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(PROTOCOLS)
end
