//
//  EmojiWidgetView.swift
//  Emojibook
//
//  Created by Koichiro OCHIISHI on 2020/10/08.
//

import SwiftUI

struct EmojiWidgetView: View {
  let emoji: Emoji
  
  var body: some View {
    ZStack {
      Color(UIColor.random)
      VStack {
        Text(emoji.character)
          .font(.system(size: 80))
        Text(emoji.name)
          .font(.headline)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .padding([.leading, .trailing])
          .foregroundColor(.white)
      }
    }
  }
}

struct EmojiWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiWidgetView(emoji: Emoji.random())
  }
}
