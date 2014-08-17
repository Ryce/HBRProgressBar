HBRProgressBar
==============

easy bi-state progress loading bar

## Usage

You need to subclass your custom ViewController from HBRViewController. Then you can use the functions to handle any kind of loading process for which you normally would use an UIActivityIndicator. You can easily start the loading animation by executing the following command

```swift
self.startProgression()
```

when loading is finished, you just need to call the finished function

```swift
self.finishProgression()
```

public variables that change the behavior of the loading animation are the following

```swift
var progressBarPosition: BarPosition = BarPosition.Top
var progressColor: UIColor = UIColor.blueColor()
```

You can change the bar position and the color