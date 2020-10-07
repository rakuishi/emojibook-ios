//
//  ContentView.swift
//  Emojibook
//
//  Created by Koichiro OCHIISHI on 2020/10/05.
//

import SwiftUI

struct EmojibookListView: View {
  let emojis = Emoji.galleries()
  @State private var showingDetail = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(emojis) { emoji in
          Button(action: {
            showingDetail.toggle()
          }, label: {
            EmojiItemView(emoji: emoji)
          }).sheet(isPresented: $showingDetail, content: {
            EmojiDetailView(emoji: emoji)
          })
        }
      }
      .foregroundColor(.black)
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("Emojibook")
    }
  }
}

struct EmojiItemView: View {
  let emoji: Emoji
  
  var body: some View {
    HStack {
      Text(emoji.character)
        .font(.title)
        .padding([.trailing])
      Text(emoji.name)
        .font(.body)
    }
  }
}

struct EmojiDetailView: View {
  let emoji: Emoji
  
  var body: some View {
    ZStack {
      Color(UIColor.random).edgesIgnoringSafeArea(.all)
      VStack {
        Text(emoji.character)
          .font(.largeTitle)
          .padding([.leading, .trailing, .bottom])
        Text(emoji.name)
          .font(.title)
          .bold()
          .padding([.leading, .trailing, .bottom])
        Text(emoji.description)
          .font(.body)
          .padding([.leading, .trailing])
      }
    }
    .foregroundColor(.white)
  }
}

extension UIColor {
  static var random: UIColor {
    switch Int.random(in: 1..<8) {
    case 0:
      return UIColor.systemRed
    case 1:
      return UIColor.systemGreen
    case 2:
      return UIColor.systemBlue
    case 3:
      return UIColor.systemOrange
    case 4:
      return UIColor.systemYellow
    case 5:
      return UIColor.systemPink
    case 6:
      return UIColor.systemPurple
    case 7:
      return UIColor.systemTeal
    default:
      return UIColor.systemIndigo
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    EmojibookListView()
  }
}
