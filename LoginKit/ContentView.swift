//
//  ContentView.swift
//  LoginKit
//
//  Created by Ravi Shah on 16/09/23.
//

import SwiftUI


struct ContentView: View {
    
    @State private var showSignup: Bool = false
    //MARK: Main View Link With NavigationView
    var body: some View {
        NavigationStack{
            Login(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup, destination: {
                    Signup(showSignup: $showSignup)
                })
        }
        .overlay{
            if #available(iOS 17, *){
                //MARK: This Support iOS 17 And 16 Too
                CircleView()
                    .animation(.easeOut(duration: 0.3), value: showSignup)
            }else{
                CircleView()
                    .animation(.easeOut(duration: 0.3), value: showSignup)
            }
        }
    }
    //MARK: Stack End Here
    
    //MARK: Moving Blur Effect or Background
    
    @ViewBuilder
    func CircleView() -> some View {
        
        Circle()
            .fill(.linearGradient(colors: [.accentColor, .teal], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
        //MARK: Moving When SignupPage Dispear or Load
            .offset(x: showSignup ? 90 : -90, y: -90)
            .blur(radius: 10)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
