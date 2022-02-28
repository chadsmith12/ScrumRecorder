//
//  ScrumStore.swift
//  ScrumRecorder
//
//  Created by Chad Smith on 2/27/22.
//

import Foundation

class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileUrl() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrums.data")
    }
    
    static func load(completion: @escaping (Result<[DailyScrum], Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileUrl = try fileUrl()
                guard let file = try? FileHandle(forReadingFrom: fileUrl) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(dailyScrums))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(scrums: [DailyScrum], completition: @escaping (Result<Int, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(scrums)
                let outputFile = try fileUrl()
                try data.write(to: outputFile)
                DispatchQueue.main.async {
                    completition(.success(scrums.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completition(.failure(error))
                }
            }
        }
    }
}
