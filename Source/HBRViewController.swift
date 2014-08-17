//
// The MIT License (MIT)
//
// Copyright (c) 2014 Hamon Riazy
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit
import QuartzCore

public enum BarPosition {
  case Top
  case TopStatus
  case Bottom
}

class HBRViewController: UIViewController {

  let kStandardBarHeight: CGFloat = 5

  var progressBarPosition: BarPosition = BarPosition.Top
  var progressColor: UIColor = UIColor.blueColor()
  
  private var isProgressing: Bool = false
  private var progressBar: UIView = UIView(frame: CGRectZero)
  
  func startProgression() {
    if !isProgressing {
      self.progressBar.frame = CGRectMake(0, self.position(), 0, kStandardBarHeight)
      self.progressBar.backgroundColor = self.progressColor
      if self.progressBar.superview != self.view {
        self.view.addSubview(self.progressBar)
      }
      self.isProgressing = true
      let barWidht: CGFloat = self.view.frame.size.width * 0.8
      UIView.animateWithDuration(1.0, animations: { () -> Void in
        self.progressBar.frame = CGRectMake(0, self.position(), barWidht, self.kStandardBarHeight)
      })
    }
  }
  
  func finishProgression() {
    if isProgressing {
      let projectileFrame = self.progressBar.layer.presentationLayer().frame
      self.progressBar.layer.removeAllAnimations()
      self.progressBar.frame = projectileFrame
      UIView.animateWithDuration(0.3, animations: { () -> Void in
        self.progressBar.frame = CGRectMake(0, self.position(), self.view.frame.size.width, self.kStandardBarHeight)
        }) { (Bool) -> Void in
          self.hideProgressBar()
      }
    }
  }
  
  private func hideProgressBar() {
    UIView.animateWithDuration(0.2, animations: { () -> Void in
      switch self.progressBarPosition {
      case .Top, .TopStatus:
        self.progressBar.frame.size.height = 0
      case .Bottom:
        self.progressBar.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(self.progressBar.frame))
      }
    }) { (Bool) -> Void in
      self.progressBar.removeFromSuperview()
      self.progressBar.transform = CGAffineTransformIdentity
      self.isProgressing = false
    }
  }
  
  func position() -> CGFloat {
    switch self.progressBarPosition {
    case .TopStatus:
      if self.navigationController {
        return CGRectGetMaxY(self.navigationController.navigationBar.frame)
      } else {
        return CGRectGetMaxY(UIApplication.sharedApplication().statusBarFrame)
      }
    case .Top:
      if self.navigationController {
        return CGRectGetMaxY(self.navigationController.navigationBar.frame)
      } else {
        return 0.0 as CGFloat
      }
    case .Bottom:
      return self.view.frame.size.height - kStandardBarHeight
    }
  }

}
