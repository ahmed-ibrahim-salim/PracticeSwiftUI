/// Copyright (c) 2021 Razeware LLC
/// 




import SwiftUI

struct AnimalsNearYouView: View {
    
    @State private var animals = [Animal]()
    private let requestManager = RequestManager()
    
    @State private var isLoading = false
    
    var body: some View {
        
        NavigationView {
            
            List{
                ForEach(animals) { animal in
                    AnimalRow(animal: animal)
                }
            }
            
        }.task{
            await fetchAnimals()
        }
        .listStyle(.plain)
        .navigationTitle("Animals near you")
        .overlay{
            if isLoading{
                ProgressView("Finding Animals near you...")
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    func fetchAnimals() async {
        
        do{
            
            let animalsContainer: AnimalsContainer =  try await requestManager.perform(AnimalsRequest.getAnimalsWith(
                page: 1,
                latitude: nil,
                longitude: nil))
            
            self.animals = animalsContainer.animals
            
            await stopLoading()
        }catch{}
    }
    
    @MainActor
    func stopLoading() async {
      isLoading = false
    }
}

struct AnimalsNearYouView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsNearYouView()
    }
}

