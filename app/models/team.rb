# == Schema Information
#
# Table name: teams
#
#  id          :bigint           not null, primary key
#  location    :string           default("all")
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
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
  has_many :articles, class_name: "Article", foreign_key: "team_id"
  has_many :subscriptions, class_name: "Subscriptions", foreign_key: "team_id"

end
