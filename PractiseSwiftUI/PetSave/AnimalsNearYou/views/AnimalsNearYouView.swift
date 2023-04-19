/// Copyright (c) 2021 Razeware LLC
/// 




import SwiftUI

struct AnimalsNearYouView: View {
    
    @State var animals = [AnimalEntity]()
    private let requestManager = RequestManager()
    
    @State var isLoading = true
    
    var body: some View {
        
        NavigationView {
            
            List{
                ForEach(animals) { animal in
                    AnimalRow(animal: animal)
                }
            }
            .navigationTitle("Animals near you")

            
        }.task{
            await fetchAnimals()
        }
        .listStyle(.plain)
        .overlay{
            if isLoading{
                ProgressView("Finding Animals near you...")
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

// Info: these for Canvas viewer and does not affect at runtime on simulator
struct AnimalsNearYouView_Previews: PreviewProvider {
    static var previews: some View {
        if let animals = CoreDataHelper.getTestAnimalEntities(){
            AnimalsNearYouView(animals: animals, isLoading: false)
        }
    }
}

// MARK: Network request and loading
extension AnimalsNearYouView{
    func fetchAnimals() async {
        do{
            let animalsContainer: AnimalsContainer =  try await requestManager.perform(
                AnimalsRequest.getAnimalsWith(
                page: 1,
                latitude: nil,
                longitude: nil))
            

//            self.animals = animalsContainer.animals
            for var animal in animalsContainer.animals{
                animal.toManagedObject()
            }
            
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
