import SwiftUI

struct FoodDetailView: View {
    @State private var calAmount: Int = 0
    @State private var proteinAmount: Int = 0
    @State private var carbAmount: Int = 0
    @State private var fatAmount: Int = 0
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text(String(calAmount) + " cal")
                        .foregroundStyle(.secondary)
                        .font(.title)
                    Spacer()
                    
                    VStack {
                        Text("\(proteinAmount) g")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        Text("Protéines")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 14))
                    }
                    .padding(4)
                    VStack {
                        Text("\(proteinAmount) g")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        Text("Glucides")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 14))
                    }
                    .padding(4)
                    VStack {
                        Text("\(proteinAmount) g")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        Text("Lipides")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 14))
                    }
                    .padding(4)
                }
                
                Text("Historique des consommations")
                    .fontWeight(.bold)
                    .padding(.top, 20)
                foodHistory(repas: "Souper", date: "13 octobre 2025", quantite: 100)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Banane")
        }
    }
}

#Preview {
    FoodDetailView()
}
struct foodHistory: View {
    var repas: String
    var date: String
    var quantite: Int
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text("\(repas)")
                    .fontWeight(.bold)
                Text("\(date)")
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text("\(quantite)g")
                .foregroundStyle(.secondary)
        }
        .padding([.top, .bottom], 8)
        
    }
}
