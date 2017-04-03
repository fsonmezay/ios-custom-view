# ios-custom-view

### Overview

In this tutorial I will create a custom UI with swift for iOS. I decided to create a custom view on ios, after I saw <a href="https://dribbble.com/prakhar" target="blank">Prakhar Neel Sharma</a>'s <a href="https://dribbble.com/shots/2326531-User-Another-User-Profile" target="blank">design</a> at <a href="https://dribbble.com" target="blank">dribbble</a>.

When you finish this tutorial, your application will look like as shown in the image. You can also download the source from <a href="http://github.com/fsonmezay/ios-custom-view" target="blank">my github repository</a>
<div class="post-image">
  <img src="http://ferdisonmezay.com/images/ios-custom-views-final.jpg" title="Final Result" height="250" />
</div>

### Development
Let's start with a `Single View Application` as follows.

<div class="post-image">
<img src="http://ferdisonmezay.com/images/ios-custom-views-create-project.jpg" title="Create Project" />
</div>

After your project is created we need to add our background and profile images into the `Assets.xcassets` folder. You can select the folder and just drag & drop the files you want to use as profile image and background image. I have named  those image files as `profile` and `background`

<div class="post-image">
<img src="http://ferdisonmezay.com/images/ios-custom-views-images.jpg" title="Image Files" />
</div>

Now we need to create a new `Cocoa Touch Class` for our custom view as follows.
You can create a new file with `Cmd+N` shortcut.

In the second popup, make sure that `UIView` is selected at Subclass section. I'll call this file `CustomView.swift`


<div class="post-image">
<img src="http://ferdisonmezay.com/images/ios-custom-views-create-class.jpg" title="Custom View Class" />
</div>


Now, it's time to write some code.
First thing I want to do is to create a function called `createCustomPath()` for drawing a `UIBezierPath`. Open `CustomView.swift` file and add these lines.

```swift
//CustomView.swift

import UIKit
class CustomView: UIView {

  // Only override draw() if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  //override func draw(_ rect: CGRect) {
      // Drawing code
  //}

  func createCustomPath(padding: CGFloat, startY: CGFloat, endY: CGFloat) -> UIBezierPath {
      let path = UIBezierPath()
      path.move(to: CGPoint(x: bounds.minX + padding, y: bounds.minY + startY))
      path.addLine(to: CGPoint(x: bounds.minX + padding, y: bounds.maxY - padding))
      path.addLine(to: CGPoint(x: bounds.maxX - padding, y: bounds.maxY - padding))
      path.addLine(to: CGPoint(x: bounds.maxX - padding, y: bounds.minY + endY))
      path.close()
      return path
  }
}
```

This function will create our custom shape.

To draw the shapes, we need to uncomment `override func  draw(_ rect: CGRect)` and call `createCustomPath()` function.

We need to set colors before we create and `fill()` our shapes, so our `draw()` function will be as follows. There are 5 different shapes in out custom UI so, I will call `createCustomPath()` function five times. First shape has the opacity value of 0.1 . Next three shapes have the opacity value of 0.2 . And the last one's opacity is set to 1.

```swift
  override func draw(_ rect: CGRect) {
    //set fill color with 0.1 opacity
    UIColor(red:255/255, green: 255/255, blue: 255/255, alpha: 0.1).set()
    createCustomPath(padding: 15, startY: 220, endY: 190).fill()

    //change fill color opacity to 0.2
    UIColor(red:255/255, green: 255/255, blue: 255/255, alpha: 0.2).set()
    createCustomPath(padding: 15, startY: 240, endY: 260).fill()
    createCustomPath(padding: 15, startY: 265, endY: 190).fill()
    createCustomPath(padding: 15, startY: 270, endY: 290).fill()

    UIColor(red:240/255, green: 240/255, blue: 240/255, alpha: 1).set()
    createCustomPath(padding: 15, startY: 340, endY: 190).fill()
}
```

Now it's time to change **ViewController.swift** file. In the ViewController we will create
 - An instance of CustomView
 - A **UIImageView** for our profile image
 - A **UISegmentedControl** view for _**Add**_ and _**Message**_ buttons
 - Two **UITextView** s for Name and Job Title fields

 Then we will add those items to our MainView with **addSubiew()** function.

We will also create **setup** functions for each field explained above, to place them in the view, and setup the height, width anchors.

```swift
  // ViewController.swift
  let customView : CustomView = {
      let view = CustomView()
      view.translatesAutoresizingMaskIntoConstraints = false;
      view.layer.shadowColor = UIColor.black.cgColor
      view.layer.shadowOffset = CGSize(width: 0, height: 0)
      view.layer.shadowOpacity = 0.4
      view.layer.shadowRadius = 25
      return view
  }()

  let profileImage: UIImageView = {
      let profileImageView = UIImageView()
      profileImageView.image = UIImage(named: "profile")
      profileImageView.translatesAutoresizingMaskIntoConstraints = false
      profileImageView.layer.cornerRadius = 35
      profileImageView.layer.borderColor = UIColor.white.cgColor
      profileImageView.layer.borderWidth = 1
      profileImageView.layer.masksToBounds = true
      return profileImageView
  }()

  let segmentedController: UISegmentedControl = {
      let sc = UISegmentedControl(items:["Add", "Message"])
      sc.translatesAutoresizingMaskIntoConstraints = false
      sc.selectedSegmentIndex = 0
      sc.tintColor = UIColor(red:40/255, green: 40/255, blue: 40/255, alpha: 1)
      sc.layer.cornerRadius = 0.0
      sc.layer.borderColor = UIColor(red:240/255, green: 240/255, blue: 240/255, alpha: 1).cgColor
      sc.layer.borderWidth = 0.1;
      sc.layer.masksToBounds = true
      return sc
  }()

  let nameTextView: UITextView = {
      let nameTextView = UITextView()
      nameTextView.text = "Ferdi Sönmezay"
      nameTextView.isEditable = false
      nameTextView.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightThin)
      nameTextView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
      nameTextView.textColor = UIColor.black
      nameTextView.translatesAutoresizingMaskIntoConstraints = false
      return nameTextView
  }()

  let summaryTextView: UITextView = {
      let summaryTextView = UITextView()
      summaryTextView.text = "Senior Software Developer, Ankara"
      summaryTextView.isEditable = false
      summaryTextView.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
      summaryTextView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
      summaryTextView.textColor = UIColor.darkGray
      summaryTextView.translatesAutoresizingMaskIntoConstraints = false
      return summaryTextView
  }()
```

After we defined our fields, now we need to add those items in our view using `view.addSubview()` function. Change `viewDidLoad()` function as follows.

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    //background-image
    UIGraphicsBeginImageContext(self.view.frame.size)
    UIImage(named: "background")?.draw(in: self.view.bounds)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    self.view.backgroundColor = UIColor(patternImage: image)

    view.addSubview(customView)
    view.addSubview(profileImage)
    view.addSubview(nameTextView)
    view.addSubview(summaryTextView)
    view.addSubview(segmentedController)
}
```

The next step is to specify anchors for each field defined above. I will create a function for each field.

```swift
func setupCustomView() {
    customView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true;
    customView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    customView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    customView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    customView.backgroundColor = UIColor(red: 100/255, green: 53/255, blue: 121/255, alpha: 0.0)
}

func setupProfileImage() {
    profileImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant:50).isActive = true
    profileImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-30).isActive = true
    profileImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
    profileImage.heightAnchor.constraint(equalToConstant: 70).isActive = true

}

func setupNameTextView() {
    nameTextView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant:10).isActive = true
    nameTextView.leftAnchor.constraint(equalTo: profileImage.leftAnchor, constant:-10).isActive = true
    nameTextView.widthAnchor.constraint(equalTo: customView.widthAnchor, constant: -40).isActive = true
    nameTextView.heightAnchor.constraint(equalToConstant: 32).isActive = true
}

func setupSummaryTextView() {
    summaryTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor).isActive = true
    summaryTextView.leftAnchor.constraint(equalTo: nameTextView.leftAnchor).isActive = true
    summaryTextView.widthAnchor.constraint(equalTo: nameTextView.widthAnchor).isActive = true
    summaryTextView.heightAnchor.constraint(equalToConstant: 24).isActive = true
}

func setupSegmentedController() {
    segmentedController.topAnchor.constraint(equalTo: summaryTextView.bottomAnchor, constant:10).isActive = true
    segmentedController.leftAnchor.constraint(equalTo: view.leftAnchor, constant:15).isActive = true
    segmentedController.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
    segmentedController.heightAnchor.constraint(equalToConstant: 60).isActive = true

}
```

Finally we need to call those functions in `viewDidLoad`, and we're done.
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    ...
    ...
    setupCustomView()
    setupProfileImage()
    setupNameTextView()
    setupSummaryTextView()
    setupSegmentedController()
}
```

