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
    
    // MARK: Network request
    func fetchAnimals() async {
        do{
            let animalsContainer: AnimalsContainer =  try await requestManager.perform(AnimalsRequest.getAnimalsWith(
                page: 1,
                latitude: nil,
                longitude: nil))
            

            self.animals = animalsContainer.animals
            
            await stopLoading()
        }catch{
            print(error)
        }
    }
    
    //info: wrapper to excute that function on Main thread
    @MainActor
    func stopLoading() async {
      isLoading = false
    }
}

// Info: these for Canvas viewer and does not affect at runtime on simulator
struct AnimalsNearYouView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsNearYouView()
    }
}

