# FunLayout
Funny auto layout

<a href="https://codebeat.co/projects/github-com-sroik-funlayout"><img alt="codebeat badge" src="https://codebeat.co/badges/8939b518-4230-4b79-b7d0-89457a896dee" /></a>

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
