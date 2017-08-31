describe "くろなつさんについて" do
  it "挨拶ができる" do
    k = Kuronat.new
    expect(k).to respond_to(:greeting)
  end
end
