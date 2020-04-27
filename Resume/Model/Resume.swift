//
//  Resume.swift
//  Resume
//
//  Created by Navneet Singh on 22/08/19.
//  Copyright © 2019 Navneet(navneet.aug1990@gmail.com,). All rights reserved.
//


struct Resume: Codable,Identifiable {
    var profile:Profile
    var summary : [String]
    var experience: [Experience]
    var skills: [Skill]
    var languages: [Language]
    var education: [Education]

    struct Profile: Codable, Identifiable {
        private var location : Location
        
        var name : String
        var title: String
        var image: String?
        var email : String
        var phone: String
        var currentLocation: String {
            return location.city + ", " + location.country
        }

        private  struct Location: Codable {
            var city : String
            var country : String
        }
    }

    struct Experience: Codable, Identifiable {
        private var startDate: String
        private var endDate: String

        var company: String
        var position: String
        var location: String
        var summary : String
        var highlights: [String]
        var duration: String {
            return startDate + " - " + endDate
        }

        static func == (lhs: Experience, rhs: Experience) -> Bool {
            return lhs.startDate == rhs.startDate && lhs.endDate == rhs.endDate && lhs.company == rhs.company
        }
    }

    struct Skill: Codable {
        private var keywords: [String]
        var name: String
        var skills: String {
            return keywords.joined(separator: ", ")
        }
    }

    struct Language : Codable, Identifiable{
        var language: String
        var level: String
        var rating : Int
    }

    struct Education: Codable, Identifiable {
        private var startDate: String
        private var endDate: String
        private var area : String
        private var category: String

        var school : String
        var cgpa: Float

        var specialization: String {
            return category + " in " + area
        }
        var duration: String {
            return startDate + " - " + endDate
        }
    }
}
