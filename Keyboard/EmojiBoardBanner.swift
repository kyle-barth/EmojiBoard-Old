//
//  CatboardBanner.swift
//  TastyImitationKeyboard
//
//  Created by Alexei Baboulevitch on 10/5/14.
//  Edited by Vitaliy Krynytskyy on 26/06/18 for the EmojiBoard project.
//  Copyright (c) 2014 Alexei Baboulevitch ("Archagon"). All rights reserved.
//

import UIKit

/*
This is the demo banner. The banner is needed so that the top row popups have somewhere to go. Might as well fill it
with something (or leave it blank if you like.)
*/

class EmojiBoardBanner: ExtraView {
    
    required init(globalColors: GlobalColors.Type?, darkMode: Bool, solidColorMode: Bool) {
        super.init(globalColors: globalColors, darkMode: darkMode, solidColorMode: solidColorMode)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
