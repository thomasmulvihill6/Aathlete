//
//  WeeklySplitView.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI
import DateGrid

struct WeeklySplit: View {
    @State private var selectedMonthDate = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "EEEE, MMMM d, Y" // Day name, Month, Day
        return formatter
    }
    
    var body: some View {
        let startDate = Calendar.current.date(byAdding: .month, value: -2, to: Date()) ?? Date()
        let endDate = Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date()
        
        VStack {
            Text((dateFormatter.string(from: selectedMonthDate)))
                .bold()
                .font(.title)
            Divider()
            HStack {
                ForEach(Calendar.current.veryShortWeekdaySymbols, id: \.self) { item in
                    Spacer()
                    Text(item)
                        .bold()
                    Spacer()
                    
                }
            }
            
            DateGrid(
                interval: .init(
                    start: startDate,
                    end: endDate
                ),
                selectedMonth: $selectedMonthDate,
                mode: .week(estimateHeight: 60)
            ) { date in
                
                Text(date.date.day)
                    .padding(8)
                    .background(Color.accentColor)
                    .cornerRadius(8)
                    .padding([.bottom], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            
            ScrollView{
                let weekDays = currentWeekDates(from: startDate)
                ForEach(0..<7){ index in
                    Text(dateFormatter.string(from: weekDays[index]))
                    Divider()
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                        .fill(Color.accentColor)
                        .opacity(0.8)
                        .frame(height: 50)
                        .padding()
                        .overlay(Text("Leg Day A")
                            .font(.title))
                }
            }
        }
    }
    
    func currentWeekDates(from date: Date) -> [Date] {
        let calendar = Calendar.current
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
}

#Preview {
    WeeklySplit()
}
