# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  status                 :integer          default("active")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  rolify
  after_create :assign_default_role

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :articles, class_name: "Article", foreign_key: "author_id"
  has_many :comments, class_name: "Comment", foreign_key: "author_id"
  has_many :advertisements, class_name: "Advertisement", foreign_key: "author_id"
  has_many :surveys, class_name: "Survey", foreign_key: "author_id"
  has_many :survey_responders, class_name: "SurveyResponder", foreign_key: "responder_id", dependent: :destroy
  has_many :completed_surveys, through: :survey_responders, source: :survey
  has_many :comment_reactions, class_name: "CommentReaction"

  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  enum :status, { blocked: 0, active: 1 }

  def admin?
    self.has_role? :admin
  end

  private 

  def assign_default_role
    self.add_role(:basic) if self.roles.blank?
  end
  
end
