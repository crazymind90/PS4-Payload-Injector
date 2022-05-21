//
//  ContentView.swift
//  PS4PayloadInj
//
//  Created by CrazyMind90 on 19/05/2022.
//

import SwiftUI


struct PayloadInjector : View {
    
    private var TextFieldBGColor = #colorLiteral(red: 0.2901960784, green: 0.2509803922, blue: 0.3411764706, alpha: 1)
    private var SendBGColor = #colorLiteral(red: 0.2345024683, green: 0.5061304659, blue: 0.8549019694, alpha: 1)
    var Model = PayloadModel()
    @State var FileToSend : String = "/Users/crazymind90/Downloads/OystersMenu_v1.3.6/Oysters_v136.bin"
    @State var iP : String = "192.168.100.94"
    @State var Port : String = "9090"
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient.init(colors: [Color.init(hex: "202020"),.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
            VStack(spacing : 3) {
        Text("PS4 Payload Injector!")
            .shadow(color: .gray, radius: 20, x: 2, y: 2)
            .font(.system(size: 20))
            .foregroundColor(.white)
 
                Text("By @CrazyMind90")
                    .foregroundColor(.secondary)
                    .font(.system(size: 10))
            }.padding(.all)
             
 
                
                TextField("ip", text: $iP)
                    .textFieldStyle(.plain)
                    .frame(width: 150, height: 30, alignment: .center)
                    .background(Color(TextFieldBGColor))
                    .multilineTextAlignment(.center)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .padding(.top,30)
                
                TextField("Port", text: $Port)
                    .textFieldStyle(.plain)
                    .frame(width: 100, height: 30, alignment: .center)
                    .background(Color(TextFieldBGColor))
                    .multilineTextAlignment(.center)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                
                TextField("FileToSend", text: $FileToSend)
                    .textFieldStyle(.plain)
                    .frame(width: 300, height: 30, alignment: .center)
                    .background(Color(TextFieldBGColor))
                    .multilineTextAlignment(.center)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    
 
                HStack {
                    
                    Button {
     
                DispatchQueue.main.async {
                let SenderPyth : String = Bundle.main.resourcePath! + "/sender.py"

                let Output = Model.RunCMDWithLog(CMD: "/usr/local/bin/python3 \(SenderPyth) --ip \(iP) --portnum \(Port) --payload \(FileToSend)")
                print(Output)
                }
                          
                    } label: {
                        
                        Text("Send")
                        
                        .colorMultiply(.white)
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 120, height: 30, alignment: .center)
                        .tint(.clear)
                        .background(Color(SendBGColor))
                        .multilineTextAlignment(.center)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        
                        .padding()
                }.niceButton()
                }.padding(.top,0)

             }
        }.frame(width: 500, height: 300, alignment: .center)
    }
}

struct PayloadInjector_Previews: PreviewProvider {
    static var previews: some View {
        PayloadInjector()
            .preferredColorScheme(.dark)
    }
}
