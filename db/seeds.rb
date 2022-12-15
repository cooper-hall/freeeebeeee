puts "Creating companies..."
Company.create(name: "Google", founding_year: 1998)
Company.create(name: "Facebook", founding_year: 2004)
Company.create(name: "Dunder Mifflin", founding_year: 2002)
Company.create(name: "Enron", founding_year: 1995)

puts "Creating devs..."
Dev.create(name: "Rick")
Dev.create(name: "Morty")
Dev.create(name: "Mr. Meseeks")
Dev.create(name: "Gazorpazop")

puts "Creating freebies..."
Freebie.create(item_name: "tshirt", value: 31, dev_id: Dev.first.id, company_id: Company.first.id)
Freebie.create(item_name: "pants", value: 23, dev_id: Dev.first.id, company_id: Company.first.id)
Freebie.create(item_name: "hats", value: 4443, dev_id: Dev.second.id, company_id: Company.second.id)
# ***************************************************************
# * TODO: create freebies! Remember, a freebie belongs to a dev *
# * and a freebie belongs to a company.                         *
# ***************************************************************
# Create freebies Here

def User.most_active #this is a class method referencing all of the users
    User.all.max_by { |u| u.tweets.count}
  end

  def retweet(tweet) #this is a instance method and is for just an individual user
    tweet.update(times_retweeted: tweet.times_retweeted + 1)
    p "Retweeted: #{tweet.content}"
    return tweet
  end

  def most_popular_tweet #this is a instance method and is for just an individual user
    return self.tweets.max_by { |t| t.times_retweeted }
  end

  def least_popular_tweet #this is a instance method and is for just an individual user
    return self.tweets.min_by { |t| t.times_retweeted }
  end

  def popular_tweets
    # user.tweets.order(times_retweeted: :asc)sort_by {|t| t.times_retweeted}.reverse
    return self.tweets.order(times_retweeted: :desc)
  end

puts "Seeding done!"
