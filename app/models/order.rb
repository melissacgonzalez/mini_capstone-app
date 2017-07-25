class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def method_name
    
  end
end
