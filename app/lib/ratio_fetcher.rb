class RatioFetcher
  def self.request_for(ref, rel)
    request = Faraday.get "https://free.currconv.com/api/v7/convert?q=#{ref}_#{rel},#{rel}_#{ref}&compact=ultra&apiKey=909106a1404e597b35f4"
    data = JSON.parse(request.body)
    ratio = data[ref+"_"+rel]
  end
end
