# P5Swift

A lightweight (?) version of P5 made in Swift.

Since the pandemic I’ve been watching watching some amazing coding challenges made by [Daniel Shiffman](https://github.com/shiffman) using a framework called [p5.js](https://p5js.org). But, since I don’t really like web dev I thought it’d be cool if I recreated p5 in Swift and followed one of those challenges/tutorials.

I have to admit that I found some other solutions here in Github (obviously better than mine) which are the following: [p5swift](https://github.com/zats/p5swift), [p5-in-swift](https://github.com/alexito4/p5-in-Swift). So, if you find something simular to those, maybe it’s not a coincidence. 

### Why?

To be honest, I could just use of those other solutions that I found, but it’s just not the same to work with something you know you did all by yourself, right?

### How?

P5Swfit is just, let’s say, a wrapper of a `CGContext`. All the drawing operations were implemented using the ones that a CoreGraphics context provides us. So… yeah I didn’t do that much.

## Usage

This is a swift package so installation is straight forward. In XCode just go to `File -> Add Package Dependencies` and put the link to this repository.

### Sketch

When you need to create a new canvas o sketch (as the p5 community like to call it) you have to to the following:

```swift
class MySktech: P5Sketch {
  func setup() {
    // it will be called only one time (when it's initialized)
  }

  func draw() {
    // it will be called every frame
  }
}
```

And then, inside your `UIViewController` you add the view (canvas) associated with the sketch

```swift
class MyViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let sketch = MySketch(ofSize: view.frame.size)
    view.addSubview(sketch.view)
  }
}
```

That’s it!

## Some examples

I made a little demo app that you can run to see some examples of what you can achieve with P5.

| Game of life | Starfield | Fourier Series |
|:--:|:--:|:--:|
| ![246639163-0fd1f710-a26f-4ed8-a88f-4a7475e39fe0](https://github.com/juandahurt/P5Swift/assets/26754335/771f5f25-e736-48f5-a042-b91cfa87125c) | ![246866221-fc850022-898d-4808-80ce-18ce688b703b](https://github.com/juandahurt/P5Swift/assets/26754335/40610ea7-694a-43a0-883e-a5cd984bb754) | ![247984017-0efc0ce0-5139-4c6b-a27f-c053a6e9433b](https://github.com/juandahurt/P5Swift/assets/26754335/0db5e54b-c239-4234-bd81-3b023e8cc81d) |

