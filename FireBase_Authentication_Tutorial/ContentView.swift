//
//  ContentView.swift
//  FireBase_Authentication_Tutorial
//
//  Created by YOUNGSIC KIM on 2020-01-20.
//  Copyright © 2020 YOUNGSIC KIM. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            MailLoginView()
            
            FaceBookLoginView().frame(width: 180, height: 50,alignment: .center).padding(10)
            
            GoogleLoginView().frame(width: 140, height: 70,alignment: .center).padding(10)
        }.animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

