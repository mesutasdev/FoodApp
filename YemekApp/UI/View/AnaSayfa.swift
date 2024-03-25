//
//  ContentView.swift
//  YemekApp
//
//  Created by asdirector on 2.03.2024.
//

import SwiftUI

struct AnaSayfa: View {
 
    @ObservedObject  var viewModel = AnaSayfaVM()
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(viewModel.yemeklerListesi){ yemek in
                    NavigationLink(destination: DetaySayfa(yemek: yemek)) {
                        YemekSatir(yemek: yemek)
                    }
                   
                }
                
            }.navigationTitle("Yemekler")
                .onAppear{
                    veritabaniKopyala()
                    viewModel.yemeklerYukle()
                    
                }
        }
    }
    
    func veritabaniKopyala(){
        let bundle = Bundle.main.path(forResource: "yemekler", ofType: ".sqlite")
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("yemekler.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: hedefYol.path){
            print("Veritabanı Daha Önce Kopyalandı!")
        }else {
            do{
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    AnaSayfa()
}
