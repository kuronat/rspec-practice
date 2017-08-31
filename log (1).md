
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

    [33m*[0m
    
    Pending: (Failures listed here are expected and do not affect your suite's status)
    [33m
      1) くろなつさんについて その名はくろなつ[0m
         [36m# Not yet implemented[0m
    [36m     # ./spec.rb:2
    [0m
    
    Finished in 0.00186 seconds (files took 0.11436 seconds to load)
    [33m1 example, 0 failures, 1 pending[0m
    


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

    [32m.[0m
    
    Finished in 0.00295 seconds (files took 0.09912 seconds to load)
    [32m1 example, 0 failures[0m
    


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

    [31mF[0m[32m.[0m
    
    Failures:
    
      1) くろなつさんについて 挨拶ができる
         [31mFailure/Error: [0m[1;34;4mDEFAULT_FAILURE_NOTIFIER[0m = lambda { |failure, _opts| raise failure }[0m
         [31m  expected #<Kuronat:0x007fe8a885eec0> to respond to :greeting[0m
         [36m# ./_spec1.rb:4:in `block (2 levels) in <top (required)>'[0m
    
    Finished in 0.02146 seconds (files took 0.10213 seconds to load)
    [31m2 examples, 1 failure[0m
    
    Failed examples:
    
    [31mrspec [0m [36m# くろなつさんについて 挨拶ができる[0m
    




* 挨拶がまだできないことが、テストが落ちたことでわかる
* できるようにする


```bash

```
