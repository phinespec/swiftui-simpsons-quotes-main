//
//  HomeView.swift
//  SimpsonsQuotes
//
//  Created by phinespec on 8/13/21.
//

import SwiftUI



struct HomeView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var charIsDisplayed = false

    var body: some View {
        
        ZStack {
            Image("cloudbg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text(viewModel.quotes.count > 0 ? viewModel.quotes[0].quote : "")
                    .frame(width: 350, height: 200)
                    .font(.custom("Simpsonfont", size: 20))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .foregroundColor(.yellow)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                
                Spacer()
                
                Image(uiImage: charIsDisplayed ? viewModel.quotes[0].image.load() : UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 300)
                Spacer()
                
                Button(action: { showCharacter() }, label: {
                    Text(!charIsDisplayed ? "Show  character" : "Next Quote")
                        .font(.custom("Simpsonfont", size: 16))
                })
                .frame(width: 200, height: 40)
                .background(Color.pink)
                .cornerRadius(20)
                .foregroundColor(.primary)
                .padding()
                
                Spacer()
            }
                
        }
        .onAppear {
            viewModel.getQuotes()
        }
    }
    
    func showCharacter() {
        if charIsDisplayed { viewModel.getQuotes() }
        charIsDisplayed.toggle()
    }
}

extension HomeView {
    
    class ViewModel: ObservableObject {
        @Published var quotes = [Quote]()
        
        func getQuotes() {
            let dataService = DataService()
            
            dataService.fetchData { [weak self] result in
                switch result {
                case .failure(let error):
                    print("Error: \(error)")
                case .success(let quotes):
                    self?.quotes = quotes
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeView.ViewModel())
    }
}
