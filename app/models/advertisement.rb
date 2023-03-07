# == Schema Information
#
# Table name: advertisements
#
#  id          :bigint           not null, primary key
#  status      :string           default("inactive")
#  type        :string           default("site_wide")
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint           not null
#  category_id :bigint           not null
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
  belongs_to :category
  belongs_to :author, class_name: 'User'
end
