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

class Track < ApplicationRecord
  validates :album_id, presence: true, uniqueness: true
  validates :song, :lyrics, :kind_of_track, presence: true

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album

  has_one :band,
    through: :album,
    source: :band
end
