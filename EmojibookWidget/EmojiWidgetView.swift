//
//  EmojiWidgetView.swift
//  Emojibook
//
//  Created by Koichiro OCHIISHI on 2020/10/08.
//

import SwiftUI
import WidgetKit

struct EmojiWidgetView: View {
  @Environment(\.widgetFamily) var family: WidgetFamily
  let emoji: Emoji
  
  @ViewBuilder
  var body: some View {
    ZStack {
      Color(UIColor.random)
      
      switch family {
      case .systemSmall:
        SmallEmojiWidgetView(emoji: emoji)
      case .systemMedium:
        MediumEmojiWidgetView(emoji: emoji)
      case .systemLarge:
        EmptyView()
      @unknown default:
        EmptyView()
      }
    }
  }
}

struct SmallEmojiWidgetView: View {
  let emoji: Emoji
  
  var body: some View {
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

struct MediumEmojiWidgetView: View {
  let emoji: Emoji
  
  var body: some View {
    HStack {
      SmallEmojiWidgetView(emoji: emoji)
      Text(emoji.description)
        .font(.body)
        .padding(.trailing, 5)
        .foregroundColor(.white)
    }.padding([.leading, .trailing])
  }
}

struct SmallEmojiWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color(UIColor.random)
      SmallEmojiWidgetView(emoji: Emoji.random())
    }
  }
}

struct MediumEmojiWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color(UIColor.random)
      MediumEmojiWidgetView(emoji: Emoji.random())
    }
  }
}
