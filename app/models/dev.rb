class Dev < ActiveRecord::Base
   has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    freebies.map { |f| f.item_name}.include?(item_name) ---longhand version
    freebies.map(&:item_name).include?(item_name)
    #this maps through all of the items associated with a dev and checks to see if the item name
    #is present with that dev
  end

  def give_away(dev, freebie)
    freebie.update(dev_id: dev.id) if freebie.dev_id == self.id
  end
    #to put in console to check Dev.first.give_away(Dev.second, Freebie.first)
    #this should give the second dev the first item if the first dev had it to begin with
    #if the dev doesnt have the freebie to give away, it is returned nil


end
