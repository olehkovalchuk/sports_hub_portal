# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#
# Indexes
#
#  index_categories_on_parent_id  (parent_id)
#
class Category < ApplicationRecord
  has_many :articles, class_name: "Article"
  has_many :teams, class_name: "Team"
  has_many :subscriptions, class_name: "Subscriptions"
  has_many :advertisements, class_name: "Advertisements"
  has_many :baners, class_name: "Baner"
  has_many :children, class_name: "Category", foreign_key: "parent_id"
  
  belongs_to :parent, class_name: "Category"  

  validates :name, presence: true, length: {maximum: 255}
end
