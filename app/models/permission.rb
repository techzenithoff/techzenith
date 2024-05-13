# == Schema Information
#
# Table name: permissions
#
#  id         :bigint           not null, primary key
#  uid        :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :bigint
#  feature_id :bigint
#

class Permission < ApplicationRecord
    # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :role,  dependent: :destroy
  belongs_to :feature,  dependent: :destroy
  has_many :permission_items,  dependent: :destroy
 
  
  #validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :permission_items ,  allow_destroy: true
  def to_param
    	"uid"
    end
end
