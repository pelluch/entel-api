# == Schema Information
#
# Table name: venues
#
#  id         :integer          not null, primary key
#  address    :text
#  commune    :text
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region     :text
#

class VenueSerializer < ActiveModel::Serializer
  attributes :id, :address, :commune, :latitude, :longitude,
  :region
end
