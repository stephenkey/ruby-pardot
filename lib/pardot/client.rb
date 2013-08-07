module Pardot
  
  class Client
    
    include HTTParty
    base_uri 'https://pi.pardot.com'
    format :json
    
    include Authentication
    include Http

    include Objects::Lists
    include Objects::Opportunities
    include Objects::Prospects
    include Objects::Users
    include Objects::Visitors
    include Objects::Visits
    include Objects::VisitorActivities
    include Objects::Campaigns
    
    attr_accessor :email, :password, :user_key, :api_key, :format
    
    def initialize email, password, user_key
      @email = email
      @password = password
      @user_key = user_key
      
      @format = "simple"
    end
    
    
  end
end
