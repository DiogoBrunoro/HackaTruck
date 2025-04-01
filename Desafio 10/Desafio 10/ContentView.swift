import SwiftUI
import Charts

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.fatch()
                    }) {
                        Text("Atualizar")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    Spacer()
                }
                .padding()
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(viewModel.valor, id: \.self) { item in
                            HStack {
                                Image(systemName: "drop.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.blue)
                                
                                Text(item.umidade ?? "Sem dados")
                                    .foregroundColor(.black)
                                    .font(.headline)
                            }
                            .frame(width: 300, height: 100)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear(perform: viewModel.fatch)
    }
}

#Preview {
    ContentView()
}
