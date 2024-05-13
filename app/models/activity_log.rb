# == Schema Information
#
# Table name: activity_logs
#
#  id         :bigint           not null, primary key
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ActivityLog < ApplicationRecord
end
