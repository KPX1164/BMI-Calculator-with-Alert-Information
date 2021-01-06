//
//  ContentView.swift
//  Random
//
//  Created by Copter on 6/1/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @State var txt:String = "BMI Calculator"
    @State var weight:String = ""
    @State var height:String = ""
    @State var showingAlert = false
    @State var sTextField = "below 18.5,between 18.5 and 24.9healthy weight range,between 25 and 29.9overweight range,between 30 and 39.9obese range"


    var body: some View {
        VStack {
            Text(txt)
                .font(.largeTitle)
                .padding()
            HStack {
                Text("Weight")
                TextField("Kg",text: $weight)
                    .keyboardType(.numberPad)
                    .padding()
            }

            HStack {
                Text("Height")
                TextField("Cm",text: $height)
                    .keyboardType(.numberPad)
                    .padding()
            }
            Button(action:{
                let result = Double(self.weight)! / pow(Double(self.height)!/100.0,2)
                self.txt = String(result)
            })
                {Text(" Calculate").padding()
                .foregroundColor(.red)
            }
            Button(action: {
                self.showingAlert = true
              //  print(self.sTextField)
            }){
                
                Text("Information")
                    .foregroundColor(.blue)
            }.padding(.all)
                .alert(isPresented: $showingAlert) { () -> Alert in
                    Alert(title: Text("information"), message: Text(sTextField), dismissButton: .default(Text("Close")))
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
