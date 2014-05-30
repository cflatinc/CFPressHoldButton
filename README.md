# Installation

## CocoaPods

[CocoaPods.org - The Dependency Manager for Objective C.](http://cocoapods.org/)

**Podfile**

```ruby
# Podfile
pod "CFPressHoldButton", :git => "https://github.com/cflatinc/CFPressHoldButton.git"
```

## Manual

Download these files from this repo, then import to your project.

- `Classes/CFPressHoldButton.h`
- `Classes/CFPressHoldButton.m`

# Usage

Inherits `CFPressHoldButtonDelegate` on your view controller.

```objc
// ViewController.h

#import <UIView+CFPressHoldButton.h>

@interface ViewController : UITableViewController<CFPressHoldButtonDelegate>
@end
```

Set delegate object.

```objc
// ViewController.m
- (void)viewDidLoad
{
    UIView *pressHoldButton = // create view;
    pressHoldbutton.delegate = self;
}
```

Implements delegate methods.

```objc
- (void)didStartHolding:(UIView *)targetView
{
    NSLog(@"do something on starting");
}

- (void)didFinishHolding:(UIView *)targetView
{
    NSLog(@"do something on finishing");
}
```

