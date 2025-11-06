import SwiftUI
import SwiftData
import Charts

struct Calories: Identifiable {
    let id = UUID()
    let title: String
    let amount: Double
}

struct DailySummaryView: View {
    
    private let maxCalories: Int = 2500
    @State private var usedCalories: Int = 1250
    
    var body: some View {
        
        
        
        NavigationView {
            VStack {
                HStack{
                    Button("", systemImage: "plus") {
                        
                    }
                    .accentColor(Color(.orange))
                    .offset(x:175, y :-400)
                    .padding(10)
                    .navigationTitle("Aujourd'hui")
                }
                List() {
                    Section(header: Text("Calories")) {
                        
                        HStack {
                            VStack {
                                Text("Restantes")
                                    .fontWeight(.bold)
                                    .padding(4)
                                HStack {
                                    Text("\(usedCalories)")
                                        .fontWeight(.bold)
                                    Text("cal")
                                        .foregroundStyle(Color(.gray))                                   
                                }
                            }
                            PercentageCircle(progress: Double(usedCalories) / Double(maxCalories), lineWidth: 8, color: Color.green)
                        }
                    }
                    Section(header: Text("Calories")) {
                        Text("dwanuda")
                    }
                }
            }
        }
    }
}

#Preview {
    DailySummaryView()
}

struct PercentageCircle: View {
    var progress: Double
    var lineWidth: CGFloat = 20
    var color: Color = .blue
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.1)
                .foregroundStyle(color)
            
            Circle()
                .trim(from:0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .foregroundStyle(color)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut(duration: 0.5), value: progress)
        }
        .frame(width: 40, height: 40)
    }
    
    
}
