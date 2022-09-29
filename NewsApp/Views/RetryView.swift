//
//  RetryView.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-28.
//

import SwiftUI

struct RetryView : View {
    let text : String
    let retryAction: () -> ()
    
    var body : some View{
        VStack(spacing:10){
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction){
                Text("try again")
            }
        }
    }
}

struct RetryView_Previews: PreviewProvider {
    static var previews: some View {
        RetryView(text: "error"){
            
        }
    }
}
