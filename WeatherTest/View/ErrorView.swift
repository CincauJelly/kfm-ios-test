//
//  ErrorView.swift
//  Core Location Test
//
//  Created by Shiddiq Syuhada on 03/03/22.
//

import SwiftUI

struct ErrorView: View {
    var errorText: String
    
    var body: some View {
        VStack {
            Image(systemName: "xmark.octagon")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text(errorText)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.red)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorText: "Error")
    }
}
