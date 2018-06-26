//
//  Catboard.swift
//  TransliteratingKeyboard
//
//  Created by Alexei Baboulevitch on 9/24/14.
//  Edited by Vitaliy Krynytskyy on 26/06/18 for the EmojiBoard project.
//  Copyright (c) 2014 Alexei Baboulevitch ("Archagon"). All rights reserved.
//

import UIKit

/*
This is the demo keyboard. If you're implementing your own keyboard, simply follow the example here and then
set the name of your KeyboardViewController subclass in the Info.plist file.
*/

class EmojiBoard: KeyboardViewController {
    
    let takeDebugScreenshot: Bool = false
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func keyPressed(_ key: Key) {
        let textDocumentProxy = self.textDocumentProxy
        
        let keyOutput = key.outputForCase(self.shiftState.uppercase())
        
        if key.type == .character || key.type == .specialCharacter {
            if let context = textDocumentProxy.documentContextBeforeInput {
                if context.count < 2 {
                    textDocumentProxy.insertText(keyOutput)
                    return
                }
                
                var index = context.endIndex
                
                index = context.index(before: index)
                if context[index] != " " {
                    textDocumentProxy.insertText(keyOutput)
                    return
                }
                
                index = context.index(before: index)
                if context[index] == " " {
                    textDocumentProxy.insertText(keyOutput)
                    return
                }

                textDocumentProxy.insertText(" ")
                textDocumentProxy.insertText(keyOutput)
                return
            }
            else {
                textDocumentProxy.insertText(keyOutput)
                return
            }
        }
        else {
            textDocumentProxy.insertText(keyOutput)
            return
        }
    }
    
    override func setupKeys() {
        super.setupKeys()
        
        if takeDebugScreenshot {
            if self.layout == nil {
                return
            }
            
            for page in keyboard.pages {
                for rowKeys in page.rows {
                    for key in rowKeys {
                        if let keyView = self.layout!.viewForKey(key) {
                            keyView.addTarget(self, action: #selector(EmojiBoard.takeScreenshotDelay), for: .touchDown)
                        }
                    }
                }
            }
        }
    }
    
//    override func createBanner() -> ExtraView? {
//        return EmojiBoardBanner(globalColors: type(of: self).globalColors, darkMode: false, solidColorMode: self.solidColorMode())
//    }
    
    @objc func takeScreenshotDelay() {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(EmojiBoard.takeScreenshot), userInfo: nil, repeats: false)
    }
    
    @objc func takeScreenshot() {
        if !self.view.bounds.isEmpty {
            UIDevice.current.beginGeneratingDeviceOrientationNotifications()
            
            let oldViewColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor(hue: (216/360.0), saturation: 0.05, brightness: 0.86, alpha: 1)
            
            let rect = self.view.bounds
            UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
            self.view.drawHierarchy(in: self.view.bounds, afterScreenUpdates: true)
            let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            // AB: consider re-enabling this when interfaceOrientation actually breaks
            //// HACK: Detecting orientation manually
            let screenSize: CGSize = UIScreen.main.bounds.size
            let orientation: UIInterfaceOrientation = screenSize.width < screenSize.height ? .portrait : .landscapeLeft
            let name = (orientation.isPortrait ? "Screenshot-Portrait" : "Screenshot-Landscape")
            
            let imagePath = "/Users/vk/Dekstop/\(name).png"
            
            if let pngRep = UIImagePNGRepresentation(capturedImage!) {
                try? pngRep.write(to: URL(fileURLWithPath: imagePath), options: [.atomic])
            }
            
            self.view.backgroundColor = oldViewColor
        }
    }
}
