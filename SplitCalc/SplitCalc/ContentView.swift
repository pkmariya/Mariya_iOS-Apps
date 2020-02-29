//
//  ContentView.swift
//  SplitCalc
//
//  Created by Mariya Arul Raj on 21/12/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var checkAmount = ""
    @State var numberOfPeople = 2
    @State var tipPercentage = 0
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / (100 * tipSelection)
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView{
                Form{
                    Section{
                        TextField("Enter the amount", text: $checkAmount)
                    }
                    Section{
                        Picker("Number of People", selection: $numberOfPeople){
                            ForEach(2 ..< 10) {
                                Text("\($0) People")
                            }
                        }
                    }
                    Section{
                        Picker("Tip Percentage", selection: $tipPercentage){
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    Text("the individual share is: \(totalPerPerson)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.orange)
            }.navigationBarTitle("Expense Splitter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
