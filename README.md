# Pollfish
SHPollfish Framework

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

## Requirements

- iOS 10.0+ / macOS 10.12+ / tvOS 10.0+ / watchOS 3.0+
- Xcode 10+
- Swift 5

## Installing

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but SHPollfish does support its use on supported platforms.

Once you have your Swift package set up, adding SHPollfish as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/saeidha/SHPollfish.git", from: "5.0")
]
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate SHPollfish into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

  ```bash
  $ git init
  ```

- Add SHPollfish as a git [submodule](https://git-scm.com/docs/git-submodule) by running the following command:

  ```bash
  $ git submodule add https://github.com/saeidha/SHPollfish.git
  ```

- Open the new `SHPollfish` folder, and drag the `SHPollfish.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `SHPollfish.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `SHPollfish.xcodeproj` folders each with two different versions of the `SHPollfish.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `SHPollfish.framework`.

- Select the top `SHPollfish.framework` for iOS and the bottom one for macOS.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `SHPollfish` will be listed as either `SHPollfish iOS`, `SHPollfish macOS`, `SHPollfish tvOS` or `SHPollfish watchOS`.

- And that's it!

  > The `SHPollfish.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.
  

## Testing

Using the Test Navigator
When you hold the pointer over a bundle, class, or method name in the test navigator, a Run button appears. You can run one test, all the tests in a class, or all the tests in a bundle depending on where you hold the pointer in the test navigator list.

* To run all tests in a bundle, hold the pointer over the test bundle name and click the Run button that appears on the right.

![Image description](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/testing_with_xcode/Art/twx-runtst-1_2x.png)

* To run all tests in a class, hold the pointer over the class name and click the Run button that appears on the right.
![Image description](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/testing_with_xcode/Art/twx-runtst-2_2x.png)

* To run a single test, hold the pointer over the test name and click the Run button that appears on the right.
![Image description](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/testing_with_xcode/Art/twx-runtst-3_2x.png)

## License

SHPollfish is released under the MIT license. 

## Authors

* **Saied Hosseinabadi** - *Initial work* - [Profile](https://github.com/saeidha)
