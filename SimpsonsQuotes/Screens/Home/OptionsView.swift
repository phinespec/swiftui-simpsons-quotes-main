//
//  OptionsView.swift
//  SimpsonsQuotes
//
//  Created by App Dev on 8/18/21.
//

import SwiftUI

struct OptionsView: View {
    var body: some View {
        VStack(spacing: 8) {
            ForEach(0..<3) { _ in
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 200, height: 60)
                        .foregroundColor(Color.secondary)
                        .luminanceToAlpha()
                    Text("Option")
                }
                
            }
            .onTapGesture {
                print("Option tapped")
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
