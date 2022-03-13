//
//  ColourPalette.swift
//  Course
//
//  Created by Ksenia Petrova on 09.03.2022.
//

import Foundation
import SwiftUI

class ColorPalette {
    // используется
    static var mainBackground: Color {
        Color.white
       // UIColor(red: 24/255, green: 40/255, blue: 57/255, alpha: 1)
    }

    static var separator: UIColor {
        UIColor.blue
       // UIColor(red: 62/255, green: 73/255, blue: 88/255, alpha: 1)
    }

    static var mainText: UIColor {
        UIColor.black
       // UIColor(red: 216/255, green: 218/255, blue: 220/255, alpha: 1)
    }
    // используется
    static var logInButtons: Color {
        Color.green
       // UIColor(red: 216/255, green: 218/255, blue: 220/255, alpha: 1)
    }
    
    // используется
    static var navigationBarItem: Color {
        Color.blue
       // UIColor(red: 216/255, green: 218/255, blue: 220/255, alpha: 1)
    }
    
    // используется
    static var activeText: Color {
        Color.blue
       // UIColor(red: 216/255, green: 218/255, blue: 220/255, alpha: 1)
    }
    // используется
    static var disableButtom: Color {
        Color.gray
       // UIColor(red: 216/255, green: 218/255, blue: 220/255, alpha: 1)
    }

    static var text: UIColor {
        UIColor.black
       // UIColor(red: 165/255, green: 170/255, blue: 177/255, alpha: 1)
    }

    // используется
    static var subtitle: Color {
        Color.gray.opacity(0.5)
       // UIColor(red: 133/255, green: 139/255, blue: 146/255, alpha: 1)
    }
}
