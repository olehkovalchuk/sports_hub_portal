# == Schema Information
#
# Table name: baners
#
#  id          :bigint           not null, primary key
#  content     :string
#  name        :string
#  status      :string           default("not_published")
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
require "test_helper"

class BanerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
