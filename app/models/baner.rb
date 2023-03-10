# == Schema Information
#
# Table name: baners
#
#  id          :bigint           not null, primary key
#  content     :string           not null
#  name        :string           not null
#  status      :string           default(NULL), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_baners_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Baner < ApplicationRecord
  belongs_to :category

  enum :status, { "not_published" => 0, "published" => 1 }, suffix: :banner

  validates :name, presence: true, length: {maximum: 255}
  validates :content, presence: true
  
  
end
