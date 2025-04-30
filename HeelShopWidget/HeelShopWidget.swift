//
//  HeelShopWidget.swift
//  HeelShopWidget
//
//  Created by Nicholas Nguyen on 4/26/25.
//

import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in _: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), savedCount: 0)
    }

    func getSnapshot(in _: Context, completion: @escaping (SimpleEntry) -> Void) {
        let sharedDefaults = UserDefaults(suiteName: "group.com.nicknguyen.heelshop")
        let cartItemCount = sharedDefaults?.integer(forKey: "cartItemCount") ?? 0
        let entry = SimpleEntry(date: Date(), savedCount: cartItemCount)
        completion(entry)
    }

    func getTimeline(in _: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []

        let sharedDefaults = UserDefaults(suiteName: "group.com.nicknguyen.heelshop")
        let cartItemCount = sharedDefaults?.integer(forKey: "cartItemCount") ?? 0

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, savedCount: cartItemCount)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let savedCount: Int
}

struct HeelShopWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            if entry.savedCount == 0 {
                Text("Cart is empty")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                Text("Saved Listings")
                    .font(.headline)
                Text("\(entry.savedCount) items")
                    .font(.title)
                    .bold()
                    .padding()
            }
        }
        .padding()
    }
}

struct HeelShopWidget: Widget {
    let kind: String = "HeelShopWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                HeelShopWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                HeelShopWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    HeelShopWidget()
} timeline: {
    SimpleEntry(date: .now, savedCount: 5)
    SimpleEntry(date: .now, savedCount: 10)
}
