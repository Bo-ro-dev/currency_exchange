class RateFetcher
  def initialize(ref, rel)
    @ref = ref
    @rel = rel
  end

  def request_for
    request = Faraday.get "https://free.currconv.com/api/v7/convert?q=#{@ref}}_#{@rel},#{@rel}_#{@ref}&compact=ultra&apiKey=909106a1404e597b35f4"
    data = JSON.parse(request.body)
    ratio = data[@rel+"_"+@ref]
  end
end
