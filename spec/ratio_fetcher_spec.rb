describe "RatioFetcher" do
  describe "#request_for" do
    context "fetch the ratio" do
      it "returns ratio" do

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
