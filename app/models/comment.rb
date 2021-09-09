class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :post_id, presence: true
  validates :user_id, presence: true
  accepts_nested_attributes_for :user, reject_if: proc {|attributes| attributes[:username].blank?}

end
