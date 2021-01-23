//
//  ContentView.swift
//  PListSwiftUI
//
//  Created by Iurie Guzun on 2021-01-23.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import SwiftUI
func getPlist(withName name: String) -> [String:Any]?
{
    if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
        let xml = FileManager.default.contents(atPath: path)
    {
        print("Inside function option 1!")
    
        return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String:Any]
    }
    print("Inside function option 2!")
    return nil
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!").onTapGesture {
            print("ContentView Text Accessed!")
            if let fruits = getPlist(withName: "PictureCoordinates") {
                print(fruits) // Output: ["Orange", "Pineapple", "Raspberry", ···]
            } else {
                print("Can't read plist file!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
