class Voting < ActiveRecord::Base
    validates_presence_of :vote, :party
    validates_format_of :postcode, :multiline => true, :with =>  /^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\s?[0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$$/i, :message => "invalid postcode", :on => :create
    before_save :get_parliamentary
    scope :voted,  -> { where(vote: true) }
    
    
    def get_parliamentary
      postcode = self.postcode.delete(' ')
      response = HTTParty.get("http://api.postcodes.io/postcodes/#{postcode}").parsed_response
      if response["status"] == 200
      self.parliamentary = response["result"]["parliamentary_constituency"]
      else
          puts "error"
      end
    end
end
