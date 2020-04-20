class User < ApplicationRecord
  has_many :displayed_diagnostics
  has_many :diagnostics, through: :displayed_diagnostics
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:technician, :after_sales_manager, :web_developer ]
end
