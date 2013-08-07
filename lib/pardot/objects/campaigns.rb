module Pardot
  module Objects
    
    module Campaigns
      
      def Campaigns
        @campaigns ||= Campaigns.new self
      end
      
      class Campaigns
        
        def initialize client
          @client = client
        end
        
        def create id, params = {}
          post "/do/create", params
        end
        
        def query params
          result = get "/do/query", params, "result"
          result["total_results"] = result["total_results"].to_i if result["total_results"]
          result
        end
        
        def read_by_id id, params = {}
          get "/do/read/id/#{id}", params
        end
        
        def update id, params = {}
          post "/do/update/#{id}"
        end
        
        protected
        
        def get path, params = {}, result = "campaign"
          response = @client.get "campaign", path, params
          result ? response[result] : response
        end
        
        def post path, params = {}, result = "campaign"
          response = @client.post "campaign", path, params
          result ? response[result] : response
        end
        
      end
      
    end
  end
end
