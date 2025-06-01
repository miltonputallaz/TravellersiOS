//
//  TravelsLocalRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 18/02/2025.
//
import CoreData
class TravelsLocalRepositoryImpl: TravelsLocalRepository {
    
    private var persistentContainer: NSPersistentContainer
    
    init(
        persistenContainer: NSPersistentContainer
    ) {
        self.persistentContainer = persistenContainer
    }
    
    func saveTravels(_ travels: [ExternalTravel]) async {
        for externalTravel in travels {
            var travel = Travel(context: persistentContainer.viewContext)
            travel.desc = externalTravel.description
            travel.title = externalTravel.title
            travel.imageId = externalTravel.imageId
            travel.owner = externalTravel.owner
        }
        do {
            try persistentContainer.viewContext.save()
        } catch {
            
        }
        
    }
    
    func saveTravelsCleaning(_ travels: [RemoteTravelResponse]) async {
        await deleteAllTravels()
        for remoteTravel in travels {
            let travel = Travel(context: persistentContainer.viewContext)
            travel.desc = remoteTravel.description
            travel.title = remoteTravel.title
            travel.imageId = remoteTravel.imageId
            travel.owner = remoteTravel.owner
            travel.id = remoteTravel.id
        }
        guard persistentContainer.viewContext.hasChanges else { return }
        do {
            try persistentContainer.viewContext.save()
        } catch(let error) {
            print("error \(error)")
        }
        
    }
    
    func getTravels() async -> [Travel] {
        let fetchRequest: NSFetchRequest<Travel> = Travel.fetchRequest()
              
      do {
          return try persistentContainer.viewContext.fetch(fetchRequest)
      } catch {
          print("Error fetching travels: \(error)")
          return []
      }
    }
    
    func deleteAllTravels() async {
        do {
            try persistentContainer.viewContext.execute(Travel.deleteAll())
        } catch {
            
        }
    }
    
    
}
