//
//  AnimalRow.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 02/11/2022.
//

import SwiftUI

struct AnimalRow: View {
    var animal: Animal
    
    var body: some View {
        HStack {
            AsyncImage(url: animal.picture) { image in
                image
                    .resizable()
            } placeholder: {
                Image("rw-logo")
                    .resizable()
                    .overlay {
                        if animal.picture != nil {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.gray.opacity(0.4))
                        }
                    }
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 112, height: 112)
            .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(animal.name)
                    .multilineTextAlignment(.center)
                    .font(.title3)
            }
            .lineLimit(1)
        }
    }
}

struct AnimalRow_Previews: PreviewProvider {
    
    static var previews: some View {
        AnimalRow(animal: Animal(organizationId: nil, url: nil,
                                 type: "", species: nil, breeds: Breed(),
                                 colors: APIColors(), age: .adult,
                                 gender: .female, size: .large,
                                 coat: nil, name: "my pet", description: nil,
                                 photos: [], videos: [], status: .adoptable,
                                 attributes: AnimalAttributes(), tags: [],
                                 contact: Contact(), publishedAt: nil, distance: nil))
    }
}
