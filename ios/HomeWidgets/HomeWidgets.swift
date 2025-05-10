//
//  HomeWidgets.swift
//  HomeWidgets
//
//  Created by seokan on 5/8/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {

// Placeholder is used as a placeholder when the widget is first displayed
    func placeholder(in context: Context) -> NewsArticleEntry {
//      Add some placeholder title and description, and get the current date
      NewsArticleEntry(date: Date(), title: "Placeholder Title", description: "Placeholder description")
    }

// Snapshot entry represents the current time and state
    func getSnapshot(in context: Context, completion: @escaping (NewsArticleEntry) -> ()) {
      let entry: NewsArticleEntry
      if context.isPreview{
        entry = placeholder(in: context)
      }
      else{
        //      Get the data from the user defaults to display
        let userDefaults = UserDefaults(suiteName: "group.com.glucofit.flutterhomewidget")
        let title = userDefaults?.string(forKey: "headline_title") ?? "No Title Set"
        let description = userDefaults?.string(forKey: "headline_description") ?? "No Description Set"
        entry = NewsArticleEntry(date: Date(), title: title, description: description)
      }
        completion(entry)
    }

//    getTimeline is called for the current and optionally future times to update the widget
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//      This just uses the snapshot function you defined earlier
      getSnapshot(in: context) { (entry) in
// atEnd policy tells widgetkit to request a new entry after the date has passed
        let timeline = Timeline(entries: [entry], policy: .atEnd)
                  completion(timeline)
              }
    }
}

struct NewsArticleEntry: TimelineEntry {
    let date: Date
    let title: String
    let description: String
}

struct HomeWidgetsEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            // 배경 그라데이션
            LinearGradient(gradient: 
                           Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.2)]), 
                           startPoint: .top,
                           endPoint: .bottomTrailing)
            
            VStack(alignment: .leading, spacing: 10) {
                // 제목 영역
                Text(entry.title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .padding(.horizontal, 12)
                    .padding(.top, 12)
                
                // 구분선
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.3))
                    .padding(.horizontal, 12)
                
                // 설명 영역
                Text(entry.description)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                    .padding(.horizontal, 12)
                    .padding(.bottom, 12)
                
                Spacer()
            }
        }
        .cornerRadius(15)
    }
}

struct HomeWidgets: Widget {
    let kind: String = "HomeWidgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                HomeWidgetsEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                HomeWidgetsEntryView(entry: entry)
                    .padding()
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.systemSmall])
    }
}
