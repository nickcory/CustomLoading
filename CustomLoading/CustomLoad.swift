//
//  CustomLoad.swift
//  CustomLoading
//
//  Created by Nick Cory on 2/8/23.
//

import SwiftUI

struct CustomLoad: View {
    
    
    @State var isAnimating = false
    @State var imgNum = 0
    
    //Images are from SFSymbols. Can replace with custom made images in real project.
    var images = ["flame", "leaf", "sun.max", "paperplane", "carrot", "car", "sailboat"]
    
    var body: some View {
        ZStack {
            Color.orange.opacity(0.75)
            VStack {
                Text("Hello world!")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack {
                    Image(systemName: "\(images[imgNum])")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle (degrees: isAnimating ? 1080:0))
                        .animation(Animation
                            .easeInOut(duration: 0.75)
                            .delay(isAnimating ? 0.5:0)
                            .repeatForever(autoreverses: false)
                                   ,value: isAnimating
                        )
                        .scaleEffect(isAnimating ? 1:0)
                        .animation(Animation
                            .easeInOut(duration: 0.75)
                            .delay(isAnimating ? 0.5:0)
                            .repeatForever(autoreverses: true)
                                   ,value: isAnimating
                        )
                    //extend frame so that when image rotates, it doesn't cause other elements to shift around.
                }.frame(width: 150, height: 150)
                    .onAppear() {
                        //withTimeInterval value set to sum of easeInOut and delay
                        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) {_ in
                            self.imgNum = Int.random(in: 0...images.count-1)
                        }
                        self.isAnimating = true
                    }
            }
        }.edgesIgnoringSafeArea(.vertical)
    }
}

struct CustomLoad_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoad()
    }
}
