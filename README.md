# Marvel-Clone


<img src="https://github.com/AhmedYasein/Marvel-Clone/blob/main/gif-marvel-53.gif" width=200 height=100 />

<h1 align= "left"> Marvel </h1>

<br>



Marvel Comics, American media and entertainment company that was widely regarded as one of the “big two” publishers in the comic industry.

<br>
<p align="center">
</p>



## Built with
- Swift 5.3 and UIKit 

## Third Party
- [Alamofire](https://github.com/Alamofire/Alamofire) 
- [sd Web Iamge](https://github.com/SDWebImage/SDWebImage)
- [RxSwift](https://github.com/ReactiveX/RxSwift)


## Requirements

* Xcode 12.x
* Swift 5.x

- install the latest version of cocoapods 

       sudo gem install cocoapods

- Go to Project directory and make pod file

       pod init

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
        pod 'Alamofire'
	pod 'SDWebImage', '~> 5.0'
	pod 'RxSwift', '6.6.0'
    	pod 'RxCocoa', '6.6.0'
end

# RxTest and RxBlocking make the most sense in the context of unit/integration tests
target 'YOUR_TESTING_TARGET' do
    pod 'RxBlocking', '6.6.0'
    pod 'RxTest', '6.6.0'
end
```

Replace `YOUR_TARGET_NAME` and then, in the `Podfile` directory, type:

```bash
$ pod install
```

  
<h3 align="left">Contact with me</h3>

 -  Ahmed Yasein - ahmed.yasein.work@gmail.com
 -  [Linkedin](https://www.linkedin.com/in/ahmedyasein/)
