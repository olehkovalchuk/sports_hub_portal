# == Schema Information
#
# Table name: advertisements
#
#  id          :bigint           not null, primary key
#  status      :string           default(NULL), not null
#  type        :string           default("site_wide"), not null
#  url         :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint           not null
#  category_id :bigint
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

  enum status: { "inactive" => 0, "active" => 1 }

  validates :url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(PROTOCOLS)
end
