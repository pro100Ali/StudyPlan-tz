//
//  ViewModel.swift
//  StudyPlan
//
//  Created by Али  on 23.06.2023.
//

import Foundation

class ViewModel {

    var semester: [Semester] = [Semester]()
    var model: Model?
    
    func fetchProducts() {
        APICaller.shared.getAllChapters { res in
            switch res {
            case .success(let success):
                self.semester = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchModel() {
        
        APICaller.shared.getStudyYear { res in
            switch res {
            case .success(let success):
                self.model = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
