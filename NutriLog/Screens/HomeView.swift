import SwiftUI
import SwiftData

struct HomeView: View {
    var body: some View {
        TabView() {
            Tab("Journée", systemImage: "sun.max") {
                DailySummaryView()
            }
            Tab("Journée", systemImage: "chart.bar.fill") {
                
            }
        }
        .accentColor(Color("mainColorTheme"))
    }
}

#Preview {
    HomeView()
        .modelContext(PersistenceController.preview.context)
}
