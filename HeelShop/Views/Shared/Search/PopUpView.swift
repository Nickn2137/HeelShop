////
////  PopUpView.swift
////  HeelShop
////
////  Created by Nicholas Nguyen on 1/18/25.
////
//
//import SwiftUI
//
//struct PopUpView: View {
//    @Binding var isVisible: Bool
//
//    var body: some View {
//        ZStack {
//            // Background overlay
//            Color.black.opacity(0.5)
//                .edgesIgnoringSafeArea(.all)
//                .onTapGesture {
//                    isVisible = false
//                }
//
//            // Pop-up content
//            VStack {
//                Text("Search Suggestions")
//                    .font(.headline)
//                Spacer()
//            }
//            .frame(width: 300, height: 200)
//            .background(Color.white)
//            .cornerRadius(12)
//            .shadow(radius: 10)
//        }
//    }
//}
//
//#Preview {
//    PopUpView(isVisible: .constant(true))
//}
