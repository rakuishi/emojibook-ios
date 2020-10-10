//
//  EmojibookWidget.swift
//  EmojibookWidget
//
//  Created by Koichiro OCHIISHI on 2020/10/07.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
  typealias Entry = SimpleEntry
  
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(date: Date(), emoji: Emoji.random())
  }
  
  func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
    let entry = SimpleEntry(date: Date(), emoji: Emoji.random())
    completion(entry)
  }
  
  func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
    var entries: [SimpleEntry] = []
    
    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
      let entry = SimpleEntry(date: entryDate, emoji: Emoji.random())
      entries.append(entry)
    }
    
    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let emoji: Emoji
}

struct EmojibookWidgetEntryView : View {
  var entry: Provider.Entry
  
  var body: some View {
    EmojiWidgetView(emoji: entry.emoji)
  }
}

@main
struct EmojibookWidget: Widget {
  let kind: String = "EmojibookWidget"
  
  var body: some WidgetConfiguration {
    StaticConfiguration(
      kind: kind,
      provider: Provider()) { entry in
      EmojibookWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("Random Emoji")
    .description("Display a widget with an emoji that is updated randomly.")
    .supportedFamilies([.systemSmall, .systemMedium])
  }
}

struct EmojibookWidget_Previews: PreviewProvider {
  static var previews: some View {
    EmojibookWidgetEntryView(entry: SimpleEntry(date: Date(), emoji: Emoji.random()))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
