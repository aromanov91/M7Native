
import SwiftUI

public enum M7RowAccessoryType {
    case none
    case radio
    case toggle
}

public enum M7RowSize {
    case none
    case s
    case m
    case l
}

public struct M7Row: View {
    
    private struct Constants {
        
        /// Size
        static var heightNone: CGFloat { return .zero }
        static var heightS: CGFloat { return M7Space.xxxs }
        static var heightL: CGFloat { return M7Space.xxs }
        static var heightM: CGFloat { return M7Space.xs }
        
        
        /// Radius
        static var radiusM: CGFloat { return M7Radius.m }
        static var radiusS: CGFloat { return M7Radius.s }
        
        /// Spacing
        static var spacingIconAndText: CGFloat { return M7Space.xxs }
    }
    
    public var text: String
    public var type: M7RowAccessoryType
    public var leadingIcon: M7IconNames
    public var leadingImage: Image
    public var size: M7RowSize
    @Binding var toggle: Bool
    private var varticalPadding = Constants.heightS
    
    
    public init(_ text: String,
                type: M7RowAccessoryType = .none,
                leadingIcon: M7IconNames = .none,
                leadingImage: Image = Image(""),
                size: M7RowSize = .m,
                toggle: Binding<Bool> = .constant(false)
                
    ) {
        self.text = text
        self.type = type
        self.size = size
        self.leadingIcon = leadingIcon
        self.leadingImage = leadingImage
        self._toggle = toggle
        self.setSize(size)
    }
    
    public var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack() {
                
                if leadingIcon != .none {
                    
                    M7Surface(background: .secondary, padding: .xxs) {
                        
                        M7Icon(leadingIcon)
                        
                    }.padding(.trailing, Constants.spacingIconAndText)
                }
                
                if leadingImage != Image("") {
                    leadingImage.frame(width: 32, height: 32)
                }
                
                if type == .toggle {
                    
                    Toggle(isOn: $toggle) {
                        M7Text(text, style: .subtitle1)
                    }
                    
                } else if type == .radio {
                    
                    M7Text(text, style: .subtitle1)
                    
                    Spacer()
                    
                    if toggle {
                        
                        ZStack {
                            Circle().fill(M7Colors.primary).frame(width: 24, height: 24)
                                .cornerRadius(12)
                            
                            Circle().fill(Color.white).frame(width: 8, height: 8)
                                .cornerRadius(4)
                        }
                        
                    } else {
                        
                        Circle().stroke(M7Colors.onSurface.disabled, lineWidth: 4).frame(width: 24, height: 24).cornerRadius(12)
                        
                    }
                    
                } else {
                    
                    M7Text(text, style: .subtitle1)
                    
                    Spacer()
                }
            }
        }.padding(.vertical, varticalPadding)
        
    }
    
    func createToggle() {
        
    }
    
    mutating func setSize(_ rowSize: M7RowSize) {
        switch size {
        
        case .s:
            self.varticalPadding = Constants.heightS
        case .m:
            self.varticalPadding = Constants.heightM
        case .l:
            self.varticalPadding = Constants.heightL
        case .none:
            self.varticalPadding = Constants.heightNone
        }
    }
}

struct M7ListRow_Previews: PreviewProvider {
    static var previews: some View {
        M7Row("dsfsdf")
    }
}

