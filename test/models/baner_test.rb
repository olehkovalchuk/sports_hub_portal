# == Schema Information
#
# Table name: baners
#
#  id          :uuid             not null, primary key
#  content     :string           not null
#  name        :string           not null
#  status      :integer          default("not_published"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :uuid             not null
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
