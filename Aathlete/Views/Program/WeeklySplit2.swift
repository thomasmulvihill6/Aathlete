//
//  WeeklySplitView.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI
import SwiftUICalendar

struct WeeklySplit2: View {
    @ObservedObject var controller: CalendarController = CalendarController(orientation: .vertical)
    
    var body: some View {
        GeometryReader { reader in
            VStack(alignment: .center, spacing: 0) {
                Text("\(controller.yearMonth.monthShortString), \(String(controller.yearMonth.year))")
                    .font(.title)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                HStack(alignment: .center, spacing: 0) {
                    ForEach(0..<7, id: \.self) { i in
                        Text(DateFormatter().shortWeekdaySymbols[i])
                            .font(.headline)
                            .frame(width: reader.size.width / 7)
                    }
                }
                
                HStack(alignment: .center, spacing: 0) {
                    ForEach(currentWeekDates(from: Date()), id: \.self) { date in
                        GeometryReader { geometry in
                            ZStack(alignment: .center) {
                                if Calendar.current.isDateInToday(date) {
                                    Circle()
                                        .padding(4)
                                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                        .foregroundColor(.orange)
                                    Text("\(dayString(from: date))")
                                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                        .font(.system(size: 10, weight: .bold, design: .default))
                                        .foregroundColor(.white)
                                } else {
                                    Text("\(dayString(from: date))")
                                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                        .font(.system(size: 10, weight: .light, design: .default))
                                        .foregroundColor(.black)
                                        .opacity(Calendar.current.isDate(date, equalTo: Date(), toGranularity: .month) ? 1 : 0.4)
                                }
                            }
                        }
                    }
                    .frame(width: reader.size.width / 7)
                }
                Spacer()
            }
        }
    }
    
    func currentWeekDates(from date: Date) -> [Date] {
        let calendar = Calendar.current
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
    
    // Helper function to get the day string
    func dayString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
}

#Preview {
    WeeklySplit2()
}
