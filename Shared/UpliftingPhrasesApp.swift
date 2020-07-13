//
//  UpliftingPhrasesApp.swift
//  Shared
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI
import CoreData

@main
struct UpliftingPhrasesApp: App {
//    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        let model = QuotesModel()
        let theme = Theme()
        let _ = requestNotificationAuthorization(model: model)
        
        return WindowGroup {
            HomeView()
                .environmentObject(model)
                .environmentObject(theme)
        }
    }
    
    private func requestNotificationAuthorization(model: QuotesModel) -> Void {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if error != nil {
                print("Notifications denied")
            }
            
            if granted {
                createDailyNotification(model: model)
            }
        }
    }
    
    private func createDailyNotification(model: QuotesModel) -> Void {
        let content = UNMutableNotificationContent()
        content.title = model.random().author
        content.body = model.random().text
        
        var date = DateComponents()
        date.calendar = Calendar.current
        date.hour = 9
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

struct UpliftingPhrasesApp_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
