class Trade < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :collection
  belongs_to :type

  validates :type_id, numericality: { other_than: 1, message: "can't be blank" }

end
