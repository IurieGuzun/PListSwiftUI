//
//  ContentView.swift
//  PListSwiftUI
//
//  Created by Iurie Guzun on 2021-01-23.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import SwiftUI
func getPlist(withName name: String) -> [String:[String]]?
{
    if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
        let xml = FileManager.default.contents(atPath: path)
    {
        print("Inside function option 1!")
    
        return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String:[String]]
    }
    print("Inside function option 2!")
    return nil
}

struct ContentView: View {
    
    var body: some View {
        Text("Hello, World!").onTapGesture {
            print("ContentView Text Accessed!")
            if let pictures = getPlist(withName: "PictureCoordinates") {
//                print(pictures["Dove"])
                print(pictures.keys)
                for k in pictures.keys {
                     print(k)
                }
                let ranIndex = Int.random(in: 0...pictures.count-1)
                let index = pictures.index(pictures.startIndex, offsetBy: ranIndex)
                
                var  myIndex = pictures.keys[index]
                print(index, ranIndex, myIndex, pictures.keys[index])
                print(pictures[myIndex]!)
                
//                print(pictures.values)
//                print(pictures)
                
            } else {
                print("Can't read plist file!")
            }
        }.onLongPressGesture {
            var nsDictionary: NSDictionary?
            if let path = Bundle.main.path(forResource: "PictureCoordinates", ofType: "plist") {
               nsDictionary = NSDictionary(contentsOfFile: path)
                print(nsDictionary!.allKeys[0])
                print(nsDictionary!.allKeys[1])
                var myKey = nsDictionary!.allKeys[3]
                print(nsDictionary!.value(forKey: myKey as! String))

            var myDict = nsDictionary!.allKeys[1]
                print(myDict)
             }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
