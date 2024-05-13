# == Schema Information
#
# Table name: accounts
#
#  id                     :bigint           not null, primary key
#  uid                    :string
#  login                  :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  accountable_type       :string
#  accountable_id         :bigint
#  role_id                :bigint           not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Account < ApplicationRecord
  include PgSearch::Model
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Relationships
  belongs_to :accountable, polymorphic: true, optional: true

  belongs_to :role

  has_many :departments, dependent: :destroy#, optional: true
  has_many :prestation_types, dependent: :destroy
  has_many :prestations, dependent: :destroy
  has_many :health_professional_types, dependent: :destroy
  has_many :physicians, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :lab_test_categories, dependent: :destroy
  has_many :lab_test_methods, dependent: :destroy
  has_many :lab_test_samples, dependent: :destroy
  has_many :lab_tests, dependent: :destroy
  has_many :lab_test_requests, dependent: :destroy
  has_many :insurances, dependent: :destroy
  has_many :lab_test_units, dependent: :destroy
  has_many :service_types, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :hospitalization_rooms, dependent: :destroy
  has_many :hospitalizations, dependent: :destroy
  has_many :hospitalization_types, dependent: :destroy
  has_many :hospitalization_reasons, dependent: :destroy
  has_many :hospitalization_transfer_reasons, dependent: :destroy
  has_many :hospitalization_transfers, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  has_many :product_forms, dependent: :destroy
  has_many :therapeutic_classes, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :physician_consultation_schedules, dependent: :destroy
  

  # Add nested attributes for profile.
  #accepts_nested_attributes_for :profile
  
  
  # Change default params ID to uid
  def to_param
    uid
  end

  def superuser?
    if self.role.name == "Superuser"
      true 
    else
      false
    end
  end

  def user?
    if self.role.name == "user"
      true 
    else
      false
    end
  end

  def admin?
    if self.role.name == "administrateur"
      true 
    else
      false
    end
  end

  def customer?
    if self.role.name == "Client"
      true 
    else
      false
    end
  end


  def taximan?
    if self.role.name == "Taximan"
      true 
    else
      false
    end
  end


end
