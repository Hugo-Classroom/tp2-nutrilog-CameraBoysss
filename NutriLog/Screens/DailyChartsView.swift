import SwiftUI
import Charts

struct DailyChartsView: View {
    var body: some View {
        
            NavigationView {
                VStack {
                    Text("Calories par repas")
                        .fontWeight(.medium)
                    Chart {
                                BarMark(x: .value("Type", "Déjeuner"),
                                        y: .value("Calories", 1000))
                                .foregroundStyle(.pink)

                                BarMark(x: .value("Type", "Dîner"),
                                        y: .value("Calories", 1250))
                                .foregroundStyle(.green)

                                BarMark(x: .value("Type", "Souper"),
                                        y: .value("Calories", 750))
                                .foregroundStyle(.blue)
                            }
                        .frame(width: 350, height: 200)
                        
                    Spacer()
                }
                .padding()
                .navigationTitle("Graphiques")
            }
            
        }
}

#Preview {
    DailyChartsView()
}

