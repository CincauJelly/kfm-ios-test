//
//  PairView.swift
//  Core Location Test
//
//  Created by Shiddiq Syuhada on 03/03/22.
//

import SwiftUI

struct PairView: View {
    let leftText: String
    let rightText: String
    
    var body: some View {
        HStack {
            Text(leftText)
            Spacer()
            Text(rightText)
        }
    }
}
struct PairView_Previews: PreviewProvider {
    static var previews: some View {
        PairView(leftText: "Left", rightText: "Right")
    }
}
