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
  has_many :articles, class_name: "Article", foreign_key: "category_id"
  has_many :teams, class_name: "Team", foreign_key: "categoty_id"
  has_many :subscriptions, class_name: "Subscriptions", foreign_key: "category_id"
  has_many :advertisements, class_name: "Advertisements", foreign_key: "category_id"
  has_many :baners, class_name: "Baner", foreign_key: "category_id"
  has_many :children, class_name: "Comment", foreign_key: "parent_id"
  
  belongs_to :parent, class_name: "Comment"              
end
