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

class Venue < ActiveRecord::Base
end
