//
//  EmptyPlaceHolderView.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-28.
//

import SwiftUI

struct EmptyPlaceHolderView : View {
    let text : String
    let image : Image?
    
    var body : some View{
        VStack(spacing:10){
            Spacer()
            if let image = self.image {
                image
                    .imageScale(.medium)
                    .font(.system(size: 60))
            }
            Text(text)
            Spacer()
        }
    }
}


struct EmptyPlaceHolderView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPlaceHolderView(text: "Nothing", image: nil)
    }
}
