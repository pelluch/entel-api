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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of [ :rut, :phone_number ]
  validates_uniqueness_of [ :rut, :phone_number ]
  validates_uniqueness_of :email, allow_nil: true
  
  belongs_to :plan
  has_many :daily_traffics
  
  def email_required?
  	false
  end

  def monthly_traffic
    monthly = daily_traffics.select("SUM(daily_traffics.megabytes) as megabytes, SUM(daily_traffics.messages) as messages,
       SUM(daily_traffics.seconds) as seconds").where("day > ? AND day < ?", Date.today - 1.month, Date.today)
    monthly = monthly.as_json.first.except! "id"
    monthly["plan_name"] = plan.name
    monthly["plan_type_name"] = plan.plan_type.name
    monthly
  end

  def create_token
    app = doorkeeper_app
    if not app
      app = Doorkeeper::Application.create name: "entel", redirect_uri: "https://127.0.0.1"
    end
    Doorkeeper::AccessToken.create resource_owner_id: self.id, application_id: app.id
  end

  def doorkeeper_app
    @app ||= Doorkeeper::Application.find_by_name("entel")    
  end

  def access_tokens
    Doorkeeper::AccessToken.where(resource_owner_id: id)
  end

  def access_token
    access_tokens.last
  end
  
end
