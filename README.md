HBRProgressBar
==============

easy bi-state progress loading bar

## Usage

You need to subclass your custom ViewController from HBRViewController. Then you can use the functions to handles any kind of loading process for which you normally would use an UIActivityIndicator. You can easily start the loading animation by executing the following command

```swift
self.startProgression()
```

when loading is finished, you just need to call the ending function

```swift
self.finishProgression()
```

public variables that change the behavior of the loading animation are the following

```swift
  var progressBarType: BarPosition = BarPosition.Top
  var progressColor: UIColor = UIColor.blueColor()
```

You can change the Bar Position to top or bottom, and you can change the bar color to any color you like