# == Schema Information
#
# Table name: teams
#
#  id          :uuid             not null, primary key
#  location    :string           default("all")
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :uuid             not null
#
# Indexes
#
#  index_teams_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Team < ApplicationRecord
  belongs_to :category
  has_many :articles, class_name: "Article"
  has_many :subscriptions, class_name: "Subscriptions"

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { scope: :category_id }
end
