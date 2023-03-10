# == Schema Information
#
# Table name: subscriptions
#
#  id          :bigint           not null, primary key
#  type        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  team_id     :bigint
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
require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
