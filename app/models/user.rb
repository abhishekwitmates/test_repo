class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events  
  # has_many :send_mails, class_name: "SendMail", dependent: :destroy  
  has_many :sending_mails, foreign_key: :receiving_mail_id, class_name: "EMail", dependent: :destroy
  # has_many :sent_mails, through: :sending_mails
  has_many :receiving_mails, foreign_key: :sending_mail_id, class_name: "EMail", dependent: :destroy
  # has_many :received_mails, through: :receiving_mails
end
