//
//  ContentView.swift
//  Flags
//
//  Created by Kiyong Kim on 2022/07/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(Nations.contintents, id: \.region) { continent in
                Section(header: Text(continent.region)) {
                    ForEach(continent.countries, id: \.name) { c in
                        CountryView(country: c)
                    }
                }
            }
        }.listStyle(SidebarListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CountryView: View {
    var country: (name: String, file: String)
    var body: some View {
        HStack {
            Image(country.file)
                .resizable()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading) {
                Text(country.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.blue)
                Text("\(country.name.count) million people")
                    .font(.footnote)
                    .foregroundColor(Color.green)
            }
        }
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(country: Nations.contintents[0].countries[0])
    }
}