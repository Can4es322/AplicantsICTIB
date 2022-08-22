////
////  NewsView.swift
////  ApplicantsIKTIB
////
////  Created by User on 18.05.2022.
////
//
//import SwiftUI
//
//struct NewsView: View {
//
//    @StateObject var viewData = ViewController()
//
//    var body: some View {
//        NavigationView {
//            VStack {
//
//                Text("Новости")
//                    .font(.system(size: 25, weight: .regular))
//                    .padding(.top, 10)
//
//                ScrollView(.vertical, showsIndicators: false) {
//                    VStack(spacing: 24) {
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack {
//                                ForEach(viewData.newsBig?.data ?? new1) {post in
//                                    BigPost(
//                                        placeHolderImage: URL(string: post.image)!,
//                                        placeHolderTitle: post.title,
//                                        placeHolderDate: post.createdAt,
//                                        placeHolderDescription: post.description)
//                                }
//
//                                GeometryReader { reader -> Color in
//
//                                    let minX = reader.frame(in: .global).minX
//
//                                    let width = UIScreen.main.bounds.width / 1.5
//
//                                    if viewData.newsBig?.meta.hasNextPage == true && minX < width {
//                                        DispatchQueue.main.async {
//                                            viewData.loadMoreContentBigNews()
//                                        }
//
//                                    }
//
//                                    return Color.clear
//                                }
//                                .frame(width: 20, height: 20)
//
//                            }
//                        }
//                        .frame(maxHeight: 450)
//
//                        ForEach(viewData.newsSmall?.data ?? new1) {post in
//                            SmallPost(
//                                placeHolderImage: URL(string: post.image)!,
//                                placeHolderTitle: post.title,
//                                placeHolderDate: post.createdAt,
//                                placeHolderDescription: post.description)
//                        }
//
//                        GeometryReader { reader -> Color in
//
//                            let minY = reader.frame(in: .global).minY
//
//                            let height = UIScreen.main.bounds.height / 1.5
//
//                            if viewData.newsSmall?.meta.hasNextPage == true && minY < height {
//                                DispatchQueue.main.async {
//                                    viewData.loadMoreContentSmallNews()
//                                }
//
//                            }
//
//                            return Color.clear
//                        }
//                        .frame(width: 20, height: 20)
//
//                    }
//                    .frame(maxHeight: .infinity)
//                }
//
//                Spacer()
//            }
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
//            .task {
//                viewData.sendBigNews(numberTake: 2)
//                viewData.sendSmallNews(numberTake: 4)
//            }
//        }
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
//
////        .task {
////            do{
////                 try await viewData.sendNews()
////            }catch{
////
////            }
////        }
//
//    }
//}
//
//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsView()
//    }
//}
