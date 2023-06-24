//
//  Discipline.swift
//  StudyPlan
//
//  Created by Али  on 21.06.2023.
//

import Foundation

class Model: Codable {
    let IUPSid: String?
    let Title: String?
    let DocumentURL: String?
    let AcademicYearId: String?
    let AcademicYear: String?
    let Semesters: [Semester]?
}

class Semester: Codable {
    let Number: String?
    let Disciplines: [Discipline]?
}

class Discipline: Codable {
    let DisciplineId: String?
    let DisciplineName: Names?
    let Lesson: [Lessons]?
}

class Names: Codable {
    let nameKk: String
    let nameRu: String
    let nameEn: String
    
    var localized: String {
          let language = Locale.current.languageCode ?? "en"
          switch language {
          case "kk":
              return nameKk
          case "ru":
              return nameRu
          default:
              return nameEn
          }
      }
}

struct Lessons: Codable {
    let LessonTypeId: String?
    let Hours: String?
    let RealHours: String?
}
