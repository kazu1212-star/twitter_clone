# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable, :omniauthable, omniauth_providers: %i[github]

  validates :name, presence: true
  validates :telephone_number, presence: true, if: -> { provider.blank? }
  validates :date_of_birth, presence: true, if: -> { provider.blank? }
  validates :uid, presence: true, uniqueness: { scope: :provider }, if: -> { uid.present? & provider.present? }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.email = auth.info.email || User.dummy_email(auth)
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name || auth.info.nickname
      user.date_of_birth = '2000/01/01'
      user.telephone_number = '123456789'
    end
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
