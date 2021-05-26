describe "RatioFetcher" do
  describe "#request_for" do
    context "fetch the ratio" do
      it "returns ratio" do
        stub_request(:get, "https://free.currconv.com/api/v7/convert?apiKey=909106a1404e597b35f4&compact=ultra&q=PLN_USD,USD_PLN").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 200, body: "{\"PLN_USD\":0.270855,\"USD_PLN\":3.692015}", headers: {})

        expect(RatioFetcher.request_for("PLN","USD")).to be_a_kind_of(Float)
      end
    end

    context "fetch the ratio of the same currencies" do
      it "returns 1" do
         expect(RatioFetcher.request_for("USD","USD")).to eq(1)
      end
    end
  end
end
