# == Schema Information
#
# Table name: categories
#
#  id         :uuid             not null, primary key
#  ancestry   :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_ancestry  (ancestry)
#
class Category < ApplicationRecord
  
  has_ancestry

  has_many :articles, class_name: "Article"
  has_many :teams, class_name: "Team"
  has_many :subscriptions, class_name: "Subscriptions"
  has_many :advertisements, class_name: "Advertisements"
  has_many :baners, class_name: "Baner"
  # has_many :children, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  
  # belongs_to :parent, sclass_name: "Category", primary_key: :id, optional: true

  validates :name, presence: true, length: {maximum: 255}
  validate :category_name_is_unique

  # validates :name, presence: true, length: {maximum: 255}, uniqueness: { scope: :parent_id }

  # scope :roots, -> { where(parent_id: nil) }
  # scope :childless, -> { where(parent_id: nil).includes(:children).where(children: {id: nil}) }
  # scope :subcategories, -> { includes(:parent).where.not(parent_id: nil) }

  scope :last_childs, -> { Category.where.not(id: Category.pluck(:ancestry).compact.map { |e| e.split('/') }.flatten.uniq) }
  
 
  def category_name_is_unique
    if parent.try(:has_children?)
      errors.add(:name, 'Duplicate subcategory name') if Category.where(id: parent.child_ids, name: name).exists?
    end
    if is_root?
      errors.add(:name, 'Duplicate category name') if  Category.roots.where(name: name).exists?
    end  
  end
end
