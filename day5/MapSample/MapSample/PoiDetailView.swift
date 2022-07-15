//
//  PoiDetailView.swift
//  MapSample
//
//  Created by Kiyong Kim on 2022/07/15.
//

import SwiftUI
import MapKit

struct PoiDetailView: View {
    let poi: PoiItem
    var body: some View {
        GeometryReader { gr in
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Group {
                        PropertyView(imageName: "tram.circle", text: poi.SIGUN_NM)
                        PropertyView(imageName: "location.circle", text: poi.SIGUN_CD)
                        PropertyView(imageName: "fork.knife.circle", text: poi.REPRSNT_FOOD_NM)
                        PropertyView(imageName: "phone.circle", text: poi.TASTFDPLC_TELNO)
                    }
//                    Map(coordinateRegion: <#T##Binding<MKCoordinateRegion>#>)
                }
            }
        }
    }
}

struct PoiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PoiDetailView(
            poi: load()
        )
    }
    static func load() -> PoiItem {
        let item = try? JSONDecoder().decode(PoiItem.self, from: json.data(using: .utf8)!)
        return item!
    }
    static let json =
        "{" +
        " \"SIGUN_NM\": \"의정부시\", " +
        " \"SIGUN_CD\": \"41150\"," +
        " \"RESTRT_NM\": \"핏제리아 루카\"," +
        " \"REPRSNT_FOOD_NM\": \"마르게리따 피자\"," +
        " \"TASTFDPLC_TELNO\": \"031-851-3589\"," +
        " \"RM_MATR\": null," +
        " \"REFINE_LOTNO_ADDR\": \"경기도 의정부시 민락동 776-2번지\"," +
        " \"REFINE_ROADNM_ADDR\": \"경기도 의정부시 송현로82번길 17\"," +
        " \"REFINE_ZIP_CD\": \"11813\"," +
        " \"REFINE_WGS84_LOGT\": \"127.0904053\"," +
        " \"REFINE_WGS84_LAT\": \"37.7454846\"" +
        "}"
}

struct PropertyView: View {
    let imageName: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 30, height: 30)
            Text(text)
        }
    }
}
