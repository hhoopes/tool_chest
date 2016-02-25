class Tool < ActiveRecord::Base    # ~> NameError: uninitialized constant ActiveRecord
  validates :name, presence: true

  belongs_to :user
  belongs_to :category


  def formatted_price
    price / 100.0
  end

end
