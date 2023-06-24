//
//  APICaller.swift
//  StudyPlan
//
//  Created by Али  on 21.06.2023.
//

import Foundation

class APICaller {
    
    static let shared = APICaller()

    func getAllChapters(completion: @escaping (Result<[Semester], Error>) -> Void) {

        let jsonData = json.data(using: .utf8)!
                let decoder = JSONDecoder()
                do {
                    let articles = try decoder.decode(Model.self, from: jsonData)
                    
//                    print(articles.disciplineName)
                    completion(.success(articles.Semesters!))
                    
                } catch let error {
                    print("Error was \(error)")
                    completion(.failure(error))
                }
            }
    
    func getStudyYear(completion: @escaping (Result<Model, Error>) -> Void) {

        let jsonData = json.data(using: .utf8)!
                let decoder = JSONDecoder()
                do {
                    let articles = try decoder.decode(Model.self, from: jsonData)
                    
//                    print(articles.disciplineName)
                    completion(.success(articles))
                    
                } catch let error {
                    print("Error was \(error)")
                    completion(.failure(error))
                }
            }

    
    let json = """
    {
        "IUPSid": "6020fdd49607af09001d5aeb",
        "Title": "ИНДИВИДУАЛЬНЫЙ УЧЕБНЫЙ ПЛАН СТУДЕНТА №2018-24907",
        "DocumentURL": "someFile.pdf",
        "AcademicYearId": "1",
        "AcademicYear": "2018-2019 учебный год",
        "Semesters": [
            {
                "Number": "5",
                "Disciplines": [
                    {
                        "DisciplineId": "5d762432cbbc35013c1dff3f",
                        "DisciplineName": {
                            "nameKk": "Электрохимия (ағылшын)",
                            "nameRu": "Электрохимия на англ. Яз ",
                            "nameEn": "Electrochemistry"
                        },
                        "Lesson": [
                            {
                                "LessonTypeId": "1",
                                "Hours": "30",
                                "RealHours": "10"
                            },
                            {
                                "LessonTypeId": "2",
                                "Hours": "15",
                                "RealHours": "5"
                            },
                            {
                                "LessonTypeId": "3",
                                "Hours": "30",
                                "RealHours": "10"
                            }
                        ]
                    },
                    {
                        "DisciplineId": "5d762431cbbc35013c1df220",
                        "DisciplineName": {
                            "nameKk": "Шет тілі C1",
                            "nameRu": "Иностранный язык C1",
                            "nameEn": "Foreign language C1"
                        },
                        "Lesson": [
                            {
                                "LessonTypeId": "1",
                                "Hours": "30",
                                "RealHours": "30"
                            },
                            {
                                "LessonTypeId": "2",
                                "Hours": "15",
                                "RealHours": "15"
                            },
                            {
                                "LessonTypeId": "3",
                                "Hours": "30",
                                "RealHours": "10"
                            }
                        ]
                    },
                    {
                        "DisciplineId": "5d762431cbbc35013c1df2a6",
                        "DisciplineName": {
                            "nameKk": "Химиялық анализ негіздері",
                            "nameRu": "Основы химического анализа",
                            "nameEn": "Fundamentals of chemical analysis"
                        },
                        "Lesson": [
                            {
                                "LessonTypeId": "1",
                                "Hours": "30",
                                "RealHours": "10"
                            },
                            {
                                "LessonTypeId": "2",
                                "Hours": "30",
                                "RealHours": "10"
                            }
                        ]
                    }
                ]
            },
            {
                "Number": "7",
                "Disciplines": [
                    {
                        "DisciplineId": "5d762432cbbc35013c1dff3f",
                        "DisciplineName": {
                            "nameKk": "Электрохимия (ағылшын)",
                            "nameRu": "Электрохимия на англ. Яз ",
                            "nameEn": "Electrochemistry"
                        },
                        "Lesson": [
                            {
                                "LessonTypeId": "1",
                                "Hours": "30",
                                "RealHours": "10"
                            },
                            {
                                "LessonTypeId": "2",
                                "Hours": "15",
                                "RealHours": "1"
                            },
                            {
                                "LessonTypeId": "3",
                                "Hours": "30",
                                "RealHours": "10"
                            }
                        ]
                    },
                    {
                        "DisciplineId": "5d762431cbbc35013c1df220",
                        "DisciplineName": {
                            "nameKk": "Шет тілі C1",
                            "nameRu": "Иностранный язык C1",
                            "nameEn": "Foreign language C1"
                        },
                        "Lesson": [
                            {
                                "LessonTypeId": "1",
                                "Hours": "30",
                                "RealHours": "30"
                            },
                            {
                                "LessonTypeId": "2",
                                "Hours": "15",
                                "RealHours": "15"
                            },
                            {
                                "LessonTypeId": "3",
                                "Hours": "30",
                                "RealHours": "10"
                            }
                        ]
                    },
                    {
                        "DisciplineId": "5d762431cbbc35013c1df2a6",
                        "DisciplineName": {
                            "nameKk": "Химиялық анализ негіздері",
                            "nameRu": "Основы химического анализа",
                            "nameEn": "Fundamentals of chemical analysis"
                        },
                        "Lesson": [
                            {
                                "LessonTypeId": "1",
                                "Hours": "30",
                                "RealHours": "10"
                            },
                            {
                                "LessonTypeId": "2",
                                "Hours": "30",
                                "RealHours": "10"
                            }
                        ]
                    }
                ]
            }
        ]
    }
    """
    
}
