require "./main"
require "./_spec1"
describe "くろなつさんについて" do
  it "その名はくろなつ" do
    k = Kuronat.new
    expect(k.name).to eq 'くろなつ'
  end
end
