class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, presence: true

  has_many :user_teams
  has_many :teams, through: :user_teams

  has_many :user_entries
  has_many :entries, through: :user_entries

  def full_name
    first_name + " " + last_name
  end
end
