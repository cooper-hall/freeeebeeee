class Company < ActiveRecord::Base
   has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie (dev, item_name, value)
    new_freebie = Freebie.create(dev_id: dev.id, item_name: item_name, value: value, company_id: self.id)
    #we need to create a new Freebie, so use .create
    #within this we need to give it a new dev, the item name will be the same, the value will be the value you give it
    #and the company id will be the same
  end

  def Company.oldest_company
    Company.all.min_by{ |c| c.founding_year }
    #this is going through all the companies and then picking out the one that has the lowest year
    #this happens with { |c| c.founding_year }, which grabs the values of each founding year for each company
  end

end
