//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Nopphadon Phanwong on 28/6/22.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View{
        Picker("theme", selection: $selection){
            ForEach(Theme.allCases){ theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
    }
}
struct ThemePicker_Previews : PreviewProvider{
    static var previews: some View{
        ThemePicker(selection: .constant(.periwinkle))
    }
}
