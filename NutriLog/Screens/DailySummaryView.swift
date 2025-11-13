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
    @State private var caloriesLeft: Int = 1250
    @State private var colorieConsumed: Int = 70
    
    @State private var proteinProgress = 0.4
    @State private var carbsProgress = 0.4
    @State private var fatProgress = 0.4
    
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    Section(header: Text("Calories")) {
                        
                        HStack {
                            VStack {
                                Text("Restantes")
                                    .fontWeight(.bold)
                                    .padding(4)
                                HStack {
                                    Text("\(caloriesLeft)")
                                        .fontWeight(.bold)
                                    Text("cal")
                                        .foregroundStyle(Color(.gray))
                                }
                            }
                            PercentageCircle(progress: Double(caloriesLeft) / Double(maxCalories), lineWidth: 8, color: Color.green)
                            
                            VStack {
                                Text("Consommées")
                                    .fontWeight(.bold)
                                    .padding(4)
                                HStack {
                                    Text("\(colorieConsumed)")
                                        .fontWeight(.bold)
                                    Text("cal")
                                        .foregroundStyle(Color(.gray))
                                }
                            }
                        }
                    }
                    Section(header: Text("Macros")) {
                        HStack {
                            macros(progress: 0.4, selectedColor: .red, macroType: "Proteines", macroTypeLetter: "P", amount: 127, maxAmount: 150)
                            Spacer()
                            macros(progress: 0.4, selectedColor: .purple, macroType: "Glucides", macroTypeLetter: "G", amount: 105, maxAmount: 125)
                            Spacer()
                            macros(progress: 0.4, selectedColor: .blue, macroType: "Lipides", macroTypeLetter: "L", amount: 35, maxAmount: 100)
                            
                        }
                    }
                    Section(header: Text("Déjeuner")) {
                        NavigationLink(destination: FoodDetailView()) {
                        }
                    }
                    Section(header: Text("Dîner")) {
                        NavigationLink(destination: FoodDetailView()) {
                        }
                        
                    }
                    Section(header: Text("Souper")) {
                        NavigationLink(destination: FoodDetailView()) {
                        }
                    }
                }
            }
            .toolbar {
                NavigationLink {
                    AddMealView()
                } label: {
                    .systemImage("plus")
                }
                .accentColor(Color(.orange))
            }
            .navigationTitle("Aujourd'hui")
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

struct PercentageBar: View {
    var progress: Double
    var height: CGFloat = 7
    var color: Color = .blue
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(color.opacity(0.1))
                    .frame(height: height)
                
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(color)
                    .frame(width: geometry.size.width * progress,
                           height: height)
                    .animation(.easeOut(duration: 0.5), value: progress)
            }
        }
        .frame(height: height)
    }
}

struct macros: View{
    var progress: Double
    var selectedColor: Color
    var macroType: String
    var macroTypeLetter: String
    var amount: Int
    var maxAmount: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(macroTypeLetter)")
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                    .background(selectedColor)
                    .cornerRadius(20)
                    .bold()
                    .font(.system(size: 14))
                
                Text("\(macroType)")
                    .foregroundStyle(selectedColor)
                    .bold()
                    .font(.system(size: 12))
            }
            PercentageBar(progress: progress, color: selectedColor)
                .frame(width: 100)
            HStack {
                Text("" + String(amount))
                    .fontWeight(.bold)
                Text("/ " + String(maxAmount) + "g")
                    .foregroundStyle(Color(.gray))
            }
        }
        Spacer()
    }
}

