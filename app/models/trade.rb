class Trade < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :collection
  belongs_to :favemember
  belongs_to :type
  
  validates :favemember_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :type_id, numericality: { other_than: 1, message: "can't be blank" }

end
