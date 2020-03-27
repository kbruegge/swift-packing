# Learn Bin Packing using Swift for great good. 


## Packing all the things

Bin packing app for swift. Why, you ask? Because I want to learn to be swifty.

So I started this commandline application template by calling 

```bash
swift package init --type executable
```

I first had to run 
```bash
sudo xcode-select -s /Applications/Xcode.app
```
to make it work. I think its because I installed the Xcode commandline tools before I installed the Xcode main application.

This comandline application uses the `Commander` library to parse some arguments for solving the binpacking problem in various ways. 
see https://en.wikipedia.org/wiki/Bin_packing_problem for more information.

Build and test either by using Xcode or via commandline 

```bash
> swift test
> swift build
```




## Utility Functions



In order to learn more about typing, protocols and extensions in Swift I extend the collections and sequence types to allow for 
summation and random selection.
You'll find these functions in `Collection+Random.swift` and `Sequence+Sum.swift`.
See [this so answer](https://stackoverflow.com/questions/26319660/whats-the-best-practice-for-naming-swift-files-that-add-extensions-to-existing)  for naming conventions.

### Sums ondSequences 

```swift
let s = [1, 2, 3, 4, 5]
// s.sum() ==  15
```

The sum function also takes custom closures so you can do this:

```swift
let elements = [(name:"a", value: 1), (name: "b", value: 2)]
let result = elements.sum(with: {el in el.value})
// result == 3.0
```

### Random Selection

Say you want to select `n` random numbers in the range `(1...10)` you cna now do it like this: 
```swift
    let result = (1..10).randomElements(n: 100)
    // result == [2, 4, 1, 9, 7, 5, 5, 1, .....]
```
The same works for any kind of collection

```swift
    let values = ["Otto", "Hans", "Helge", "Herbert", "Bochum"]
    let result = values.randomElements(n: 2)
    // result == ["Helge", "Herbert"]
```
