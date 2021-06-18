class RatioFetcher

  def initialize(ref, rel)
    @ref = ref
    @rel = rel
  end

  def request_for
    if Redis.new.get("exp_ratio_#{@ref}_#{@rel}") #temporary cache exists
      Redis.new.get("exp_ratio_#{@ref}_#{@rel}").to_f
    else      #if temporary cache expired, make request and set new caches
      ratio = get_ratio
      Redis.new.set("exp_ratio_#{@ref}_#{@rel}", ratio)
      Redis.new.expire("exp_ratio_#{@ref}_#{@rel}", 1800)
      Redis.new.set("last_ratio_#{@ref}_#{@rel}", ratio)
      ratio
    end
  rescue => error
    puts "Error occured: #{error.inspect}"
    Redis.new.get("last_ratio_#{@ref}_#{@rel}").to_f
  end

  def get_ratio
    request = Faraday.get "https://free.currconv.com/api/v7/convert?q=#{@ref}_#{@rel},#{@rel}_#{@ref}&compact=ultra&apiKey=909106a1404e597b35f4"
    data = JSON.parse(request.body)
    data[@ref+"_"+@rel]
  end

end
