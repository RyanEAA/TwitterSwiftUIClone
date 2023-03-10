//
//  FeedView.swift
//  TwitterSwiftUIClone
//
//  Created by Ryan Aparicio on 1/30/23.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false //used to navigate windows
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.tweets){tweet in
                        TweetRowView(tweet: tweet)
                            .padding()
                    }
                }
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "arrow.up")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
                
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView){
                NewTweetView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
