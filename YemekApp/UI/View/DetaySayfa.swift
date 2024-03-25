//
//  DetaySayfa.swift
//  YemekApp
//
//  Created by asdirector on 2.03.2024.
//

import SwiftUI

struct DetaySayfa: View {
    
  var yemek = Yemekler()
    
    var body: some View {
        VStack(spacing: 100){
            
            Image(yemek.yemek_resim_adi!)
            
            Text("\(yemek.yemek_fiyat!)₺").font(.system(size: 50)).foregroundColor(.blue)
            
            Button("Sipariş Ver"){
                print("\(yemek.yemek_adi!) Sipariş verildi.")
                    
            }.foregroundColor(.white)
                .frame(width:250, height:50)
                .background(.blue)
                .cornerRadius(10)
            
        }.navigationTitle(yemek.yemek_adi!)
    }
}

//#Preview {
//    DetaySayfa()
//}
