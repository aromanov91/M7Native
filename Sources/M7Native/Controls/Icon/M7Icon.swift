//  
//
//  Created by Alexander Romanov on 13.09.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI

public enum M7IconNames: String, CaseIterable {
    
    case none = ""
    case menu = "menu"
    case send = "send"
    case menuLine2 = "menu2line"
    case home = "home"
    case compass = "compass"
    case chevronDown = "chevron-down"
    case chevronUp = "chevron-up"
    case compassLeft = "chevron-left"
    case compassRight = "chevron-right"
    case type = "type"
    case userAdd = "user-plus"
    case book = "book"
    case trash = "trash"
    case trash2 = "trash-2"
    case camera = "camera"
    case bell = "bell"
    case lock = "lock"
    case heart = "heart"
    case moon = "moon"
    case settings = "settings"
    case newItem = "newItem"
    case wifi = "wifi"
    case wifiOff = "wifi-off"
    case watch = "watch"
    case xrossMini = "x-mini"
    case xross = "x"
    case volume = "volume"
    case volumeOff = "volume-x"
    case volumeMax = "volume-2"
    case volumeMin = "volume-1"
    case users = "users"
    case user = "user"
    case userDelete = "user-x"
    case upload = "upload"
    case uploadCloud = "upload-cloud"
    case sliders = "sliders"
    case shoppingBag = "shopping-bag"
    case shield = "shield"
    case power = "power"
    case plus = "plus"
    case percent = "percent"
    case penTool = "pen-tool"
    case pause = "pause"
    case paperClip = "paperclip"
    case package = "package"
    case music = "music"
    case navigation = "navigation"
    case moreVertical = "more-vertical"
    case moreHorizontal = "more-horizontal"
    case monitor = "monitor"
    case mic = "mic"
    case messageSquare = "message-square"
    case messageCircle = "message-circle"
    case map = "map"
    case mapPin = "map-pin"
    case mail = "mail"
    case logOut = "log-out"
    case logIn = "log-in"
    case loader = "loader"
    case link = "link"
    case lifeBuoy = "life-buoy"
    case key = "key"
    case instagram = "instagram"
    case inbox = "inbox"
    case image = "image"
    case settingsHexagon = "hexagon"
    case helpCircle = "help-circle"
    case grid = "grid"
    case globe = "globe"
    case folder = "folder"
    case folderPlus = "folder-plus"
    case folderMinus = "folder-minus"
    case filter = "filter"
    case film = "film"
    case file = "file"
    case fileNew = "file-plus"
    case facebook = "facebook"
    case eye = "eye"
    case eyeOff = "eye-off"
    case delete = "delete"
    case copy = "copy"
    case circle = "circle"
    case clock = "clock"
    case clipboard = "clipboard"
    case check = "check"
    case calendar = "calendar"
    case briefcase = "briefcase"
    case bookmark = "bookmark"
    case ruller = "ruller"
    case arrowUp = "arrow-up"
    case arrowRight = "arrow-right"
    case arrowLeft = "arrow-left"
    case arrowDown = "arrow-down"
    case email = "at-sign"
    case airplay = "airplay"
    case arrowUpCircle = "arrow-up-circle"
    case arrowRightCircle = "arrow-right-circle"
    case arrowLeftCircle = "arrow-left-circle"
    case arrowDownCircle = "arrow-down-circle"
    case refresh = "arefresh-cw"
    
}

public enum M7IconSizes: Int, CaseIterable {
    case s
    case m
    case l
}

public struct M7Icon: View {
    
    private struct Constants {
        
        /// Size
        static var s: CGFloat = M7Space.s
        static var m: CGFloat = M7Space.m
        static var l: CGFloat = M7Space.l
        
    }
    
    let name: M7IconNames
    var size: CGFloat = Constants.m
    var color: M7Color
    
    public init(_ name: M7IconNames = .menu) {
        self.name = name
        self.color = M7Color.onBackgroundHighEmphasis
        self.setTextStyle(M7IconSizes.m)
    }
    
    public init(_ name: M7IconNames = .menu, size: M7IconSizes = .m, color: M7Color = .onBackgroundHighEmphasis) {
        self.name = name
        self.color = color
        self.setTextStyle(size)
    }
    
    public var body: some View {
        Image(name.rawValue)
            .resizable()
            .frame(width: size, height: size)
            .foregroundColor(color.color)
    }
    
    private mutating func setTextStyle(_ size: M7IconSizes) {
        switch size {
        case .m:
            break
        case .s:
            self.size = Constants.s
        case .l:
            self.size = Constants.l
        }
    }
}
