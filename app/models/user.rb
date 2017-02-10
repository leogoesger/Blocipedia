class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save {self.role ||= :standard}
  enum role: [:standard, :premium, :admin]
  has_many :wikiis
  has_many :collaborators, through: :wikiis
end
