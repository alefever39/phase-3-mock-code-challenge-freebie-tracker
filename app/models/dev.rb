class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    !!self.freebies.find_by(item_name: item_name)
  end

  #   orig_dev = Dev.first
  # freebie = orig_dev.freebies.first
  #   new_dev = Dev.last

  def give_away(dev, freebie)
    freebie.update(dev_id: dev.id) if (self.id == freebie.dev_id)
  end
end
