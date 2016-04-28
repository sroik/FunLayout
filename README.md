# FunLayout
Funny auto layout

<a href="https://codebeat.co/projects/github-com-sroik-funlayout"><img alt="codebeat badge" src="https://codebeat.co/badges/8939b518-4230-4b79-b7d0-89457a896dee" /></a>

## Introduction
- Are U tired of the Apple's Auto Layout? 
- Yes!

That's is the main reason for creation FunLayout. FunLayout based on swift operators overloading.

## Usage
Use the following formula:
```swift
firstItem.fun_attribute % priority {== or ~, <=, >=} secondItem.fun_attribute {*, /} multiplier {+, -} constant
```

Before use FunLayout, make sure that view.translatesAutoresizingMaskIntoConstraints is false, or set it to false
```swift
view.translatesAutoresizingMaskIntoConstraints = false
```
Alternatively U can use fun_prepareForLayout() function, which also clean all old constraints.
```swift
view.fun_prepareForLayout()
```

## Example

```swift
import FunLayout

class ViewController: UIViewController {

    lazy var box = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.box)
        
        self.box.fun_prepareForLayout()
        self.box.fun_size == self.view
        self.box.fun_center == self.view
        
    }

}
```

## License

MIT license. See the `LICENSE` file for details.
