import SwiftUI

struct AddMealView: View {
    
    @Binding var showAddMeal: Bool
    
    @State private var choix: MealType = .breakfast
    @State private var mealPortion: Int = 100
    @State private var selectedMeal: Food = MockData.darkChocolate
    
    var body: some View {
        
        VStack() {
            HStack {
                Button("", systemImage: "xmark") {
                    showAddMeal = false
                }
                .frame(width: 30, height: 30)
                .accentColor(.black)
                Text("Ajouter une entrée")
                    .padding(.leading, 75)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Menu {
                ForEach(MockData.foods, id: \.name) { food in
                    Button(food.name) {
                        selectedMeal = food
                    }
                }
            } label: {
                HStack {
                    Text("\(selectedMeal.name)")
                    Image(systemName: "chevron.up.chevron.down")
                }
            }
            .padding([.top, .bottom], 25)
            .accentColor(.orange)
            
            HStack {
                Text("Portions: " + String(mealPortion) + "g")
                Spacer()
                Stepper ("", value: $mealPortion, in: 0...2000, step: 10)
            }
            .padding(.bottom, 15)
            
            Picker("Type de chocolat", selection: $choix) {
                        ForEach(MealType.allCases) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.bottom, 15)
            
            VStack(alignment: .leading) {
                Text("Macros pour " + String(mealPortion) + "g")
                    .fontWeight(.bold)
                
                HStack {
                    Text("Calories: ")
                    Spacer()
                    Text(String(format: "%.1f kcal", selectedMeal.calories * (Double) (mealPortion) / 100))
                        .fontWeight(.bold)
                }
                .padding(.top, 2)
                HStack {
                    Text("Protéines: ")
                    Spacer()
                    Text(String(format: "%.1f g", selectedMeal.protein * (Double) (mealPortion) / 100))
                        .fontWeight(.bold)
                }
                .padding(.top, 2)
                HStack {
                    Text("Glucides: ")
                    Spacer()
                    Text(String(format: "%.1f g", selectedMeal.carbs * (Double) (mealPortion) / 100))
                        .fontWeight(.bold)
                }
                .padding(.top, 2)
                HStack {
                    Text("Lipides: ")
                    Spacer()
                    Text(String(format: "%.1f g", selectedMeal.fat * (Double) (mealPortion) / 100))
                        .fontWeight(.bold)
                }
                .padding(.top, 2)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray5))
            .cornerRadius(10)
            
            Spacer()
            
            Button("Sauvegarder") {
                showAddMeal = false
                saveMeal()
            }
            .foregroundStyle(Color(.white))
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.orange)
            .cornerRadius(10)
                        
        }
        .padding()
        
    }
}

#Preview {
    AddMealView(showAddMeal: .constant(true))
}

func saveMeal() {
    
}
