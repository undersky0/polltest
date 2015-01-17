json.array!(@votings) do |voting|
  json.extract! voting, :id, :postcode, :parliamentary, :party, :vote
  json.url voting_url(voting, format: :json)
end
