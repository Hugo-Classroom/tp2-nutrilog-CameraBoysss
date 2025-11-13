import SwiftUI

struct DailyChartsView: View {
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                
                Text("Calories par repas")
                
                Spacer()
                
            }
            .navigationTitle("Graphiques")
        }
    }
}

#Preview {
    DailyChartsView()
}
