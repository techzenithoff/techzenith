# == Schema Information
#
# Table name: permission_items
#
#  id            :bigint           not null, primary key
#  uid           :string
#  permission_id :bigint
#  action_name   :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PermissionItem < ApplicationRecord
	include PgSearch::Model
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :permission
end
