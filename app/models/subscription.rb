# == Schema Information
#
# Table name: subscriptions
#
#  id          :uuid             not null, primary key
#  type        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :uuid
#  team_id     :uuid
#
# Indexes
#
#  index_subscriptions_on_category_id  (category_id)
#  index_subscriptions_on_team_id      (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (team_id => teams.id)
#
class Subscription < ApplicationRecord
  belongs_to :category
  belongs_to :team

  validates :type, presence: true
end
