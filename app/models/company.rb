class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    self.freebies << Freebie.create(
      item_name: item_name,
      value: value,
      dev_id: dev.id
    )
  end

  def self.oldest_company
    self.where(founding_year: self.minimum(:founding_year))
  end
end
