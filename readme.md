# RSpec入門
* Railsとは関係なく、RSpecそのものについて学ぶ
* RSpec自体はRailsとは独立して使うことができる
* 関係ないけどJupyter便利(bashカーネルを入れた)


```bash
gem i rspec
```

    Successfully installed rspec-3.6.0
    Parsing documentation for rspec-3.6.0
    Done installing documentation for rspec after 0 seconds
    1 gem installed


## 最初のテスト


```bash
cat ./main.rb
```

    class Kuronat
      def name
        "くろなつ"
      end
    end



```bash
cat ./spec.rb
```

    describe "くろなつさんについて" do
      it "その名はくろなつ"
    end



```bash
rspec ./spec.rb
```

    *
    
    Pending: (Failures listed here are expected and do not affect your suite's status)
    
      1) くろなつさんについて その名はくろなつ
         # Not yet implemented
         # ./spec.rb:2
    
    
    Finished in 0.00186 seconds (files took 0.11436 seconds to load)
    1 example, 0 failures, 1 pending
    


* 未実装のやつはpendingにカウントされる
* ここで、テストを書いてみる


```bash
cat ./spec.rb
```

    require "./main"
    describe "くろなつさんについて" do
      it "その名はくろなつ" do
        k = Kuronat.new
        expect(k.name).to eq 'くろなつ'
      end
    end



```bash
rspec ./spec.rb
```

    .
    
    Finished in 0.00295 seconds (files took 0.09912 seconds to load)
    1 example, 0 failures
    


## テストを増やす


```bash
cat ./_spec1.rb
```

    describe "くろなつさんについて" do
      it "挨拶ができる" do
        k = Kuronat.new
        expect(k).to respond_to(:greeting)
      end
    end



```bash
cat ./spec.rb
```

    require "./main"
    require "./_spec1"
    describe "くろなつさんについて" do
      it "その名はくろなつ" do
        k = Kuronat.new
        expect(k.name).to eq 'くろなつ'
      end
    end



```bash
rspec ./spec.rb
```

    F.
    
    Failures:
    
      1) くろなつさんについて 挨拶ができる
         Failure/Error: DEFAULT_FAILURE_NOTIFIER = lambda { |failure, _opts| raise failure }
           expected #<Kuronat:0x007fe8a885eec0> to respond to :greeting
         # ./_spec1.rb:4:in `block (2 levels) in <top (required)>'
    
    Finished in 0.02146 seconds (files took 0.10213 seconds to load)
    2 examples, 1 failure
    
    Failed examples:
    
    rspec  # くろなつさんについて 挨拶ができる
    




* 挨拶がまだできないことが、テストが落ちたことでわかる
* できるようにする
