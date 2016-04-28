# FunLayout
Funny auto layout

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
