# == Schema Information
#
# Table name: tracks
#
#  id            :integer          not null, primary key
#  song          :string           not null
#  album_id      :integer          not null
#  lyrics        :text             not null
#  kind_of_track :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
