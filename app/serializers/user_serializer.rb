# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :text
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :text
#  last_name              :text
#  rut                    :text             not null
#  phone_number           :text             not null
#  account_holder         :text
#  created_at             :datetime
#  updated_at             :datetime
#  plan_id                :integer
#

class UserSerializer < ActiveModel::Serializer
	attributes :id, :email, :first_name, :last_name, :name, :rut, :phone_number,
	:account_holder

	has_one :access_token, serializer: AccessTokenSerializer

end
