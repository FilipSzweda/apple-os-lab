import Foundation

struct Location {
    let id: Int
    var type: String
    var name: String
    var rating: Int

    func toString() -> String {  
        return "id: " + String(id) + ", type: " + type + ", name: " + name + ", rating: " + String(rating)
    }
}

struct City {
    let id: Int
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    var keywords: [String] = []
    var locations: [Location] = []

    func toString(simple: Bool) -> String {
        var cityString =    "id: " + String(id) + ", name: " + name + ", description: " + description + ", latitude: "
                            + String(latitude) + ", longitude: " + String(longitude)
        if(simple) {
            return cityString
        }
        cityString += ", keywords: "
        for keyword in keywords {
            cityString += keyword
            if(keyword != keywords[keywords.count - 1]) {
                cityString += ", "
            }
        }
        return cityString
    }
}

func searchByName(cityName: String) -> [City] {
    var citiesWithMatchingName: [City] = []
    for city in cities {
        if (city.name == cityName) {
            citiesWithMatchingName.append(city)
        }
    }
    return citiesWithMatchingName
}

func searchByKeyword(cityKeyword: String) -> [City] {
    var citiesWithMatchingKeyword: [City] = []
    for city in cities {
        for keyword in city.keywords {
            if (keyword == cityKeyword) {
                citiesWithMatchingKeyword.append(city)
            }
        }
    }
    return citiesWithMatchingKeyword
}

func calculateDistance(cityA: City, cityB: City) -> Double {
    let R = 6371.0
    let dlon = cityB.longitude * .pi / 180 - cityA.longitude * .pi / 180
    let dlat = cityB.latitude * .pi / 180 - cityA.latitude * .pi / 180
    let a = pow(sin(dlat / 2), 2) + cos(cityA.latitude) * cos(cityB.latitude) * pow(sin(dlon / 2), 2)
    let c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c
}

func calculateDistance(longitudeA: Double, longitudeB: Double, latitudeA: Double, latitudeB: Double) -> Double {
    let R = 6371.0
    let dlon = longitudeB * .pi / 180 - longitudeA * .pi / 180
    let dlat = latitudeB * .pi / 180 - latitudeA * .pi / 180
    let a = pow(sin(dlat / 2), 2) + cos(latitudeA) * cos(latitudeB) * pow(sin(dlon / 2), 2)
    let c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c
}

func displayClosestAndFurthest(userLongitude: Double, userLatitude: Double) {
    var closestDistance = Double.infinity
    var closestCity: City!

    var furthestDistance = 0.0
    var furthestCity: City!

    for city in cities {
        let distance = calculateDistance(longitudeA: userLongitude, longitudeB: city.longitude, latitudeA: userLatitude, latitudeB: city.latitude)
        if(distance > furthestDistance) {
            furthestDistance = distance
            furthestCity = city
        }
        if(distance < closestDistance) {
            closestDistance = distance
            closestCity = city
        }
    }
    
    print("\nClosest city to longitude " +  String(userLongitude) + ", latitude: " + String(userLatitude) + ": ")
    print("\t" + closestCity.toString(simple: true))
    print("Furthest city to longitude " +  String(userLongitude) + ", latitude: " + String(userLatitude) + ": ")
    print("\t" + furthestCity.toString(simple: true))
}

func displayTwoFurthest() {
    var furthestDistance = 0.0
    var furthestCityA: City!
    var furthestCityB: City!
    for testedCityA in cities {
        for testedCityB in cities {
            if(testedCityA.id != testedCityB.id) {
                let distance = calculateDistance(cityA: testedCityA, cityB: testedCityB)
                if(distance > furthestDistance) {
                    furthestDistance = distance
                    furthestCityA = testedCityA
                    furthestCityB = testedCityB
                }
            }
        }
    }
    print("\nTwo furthest cities:")
    print("\t" + furthestCityA.toString(simple: true))
    print("\t" + furthestCityB.toString(simple: true))
}

func displayCitiesWith5StarRestaurants() {
    print("\nCities with 5 star restaurants")
    for city in cities {
        for location in city.locations {
            if(location.type == "restaurant" && location.rating == 5) {
                print("\t" + city.toString(simple: true))
                break
            }
        }
    }
}

func getSortedLocations(cityA: City) -> [Location] {
    return cityA.locations.sorted{ $0.rating > $1.rating }
}

func displayCitiesWith5StarLocations() {
    print("\nCities with 5 star locations:")
    for city in cities {
        var locations: [Location] = []
        for location in city.locations {
            if(location.rating == 5) {
                locations.append(location)
            }
        }
        if(locations.count > 0) {
            print("\tid: " + String(city.id) + ", name: " + city.name + ", number of 5 star locations: " + String(locations.count))
            for location in locations {
                print("\t\t" + location.toString())
            }
        }
    }
}

var cities: [City] = [
    City(id: 0, name: "Gdansk", description: "GUT is there", latitude: 54.22, longitude: 18.38, keywords: ["seaside", "music"],
    locations: [Location(id: 0, type: "museum", name: "MuseumA", rating: 5), Location(id: 1, type: "monument", name: "MonumentA", rating: 5)]),
    City(id: 1, name: "Warsaw", description: "Capital of Poland", latitude: 52.14, longitude: 21.01, keywords: ["party", "sport"],
    locations: [Location(id: 2, type: "museum", name: "MuseumB", rating: 2)]),
    City(id: 2, name: "Hamburg", description: "Sounds funny if you add -er", latitude: 53.34, longitude: 10.00, keywords: ["seaside"],
    locations: [Location(id: 3, type: "restaurant", name: "RestaurantA", rating: 4)]),
    City(id: 3, name: "Brussels", description: "I've been there", latitude: 50.51, longitude: 4.21, keywords: ["party"],
    locations: [Location(id: 4, type: "museum", name: "MuseumC", rating: 1)]),
    City(id: 4, name: "Ljubljana", description: "Difficult to pronounce", latitude: 46.03, longitude: 14.31, keywords: ["nature"],
    locations: [Location(id: 5, type: "museum", name: "MuseumD", rating: 2), Location(id: 6, type: "monument", name: "MonumentB", rating: 4)]),
    City(id: 5, name: "Athens", description: "Famous for democracy", latitude: 37.58, longitude: 23.43, keywords: ["seaside", "ancient"],
    locations: [Location(id: 7, type: "restaurant", name: "RestaurantB", rating: 5)]),
    City(id: 6, name: "Cluj-Napoca", description: "You've probably never heard of it", latitude: 43.46, longitude: 23.35, keywords: ["hungarian"],
    locations: [Location(id: 8, type: "restaurant", name: "RestaurantC", rating: 5)]),
    City(id: 7, name: "Rome", description: "SPQR", latitude: 41.54, longitude: 12.30, keywords: ["ancient"],
    locations: [Location(id: 9, type: "museum", name: "MuseumE", rating: 1)]),
    City(id: 8, name: "Stockholm", description: "Seems like a nice place", latitude: 59.20, longitude: 18.04, keywords: ["seaside", "party"],
    locations: [Location(id: 13, type: "restaurant", name: "RestaurantD", rating: 2)]),
    City(id: 9, name: "Reykjavik", description: "Death Stranding happens here", latitude: 64.08, longitude: -21.56, keywords: ["seaside", "cold climate"],
    locations: [Location(id: 14, type: "museum", name: "MuseumF", rating: 4)]),
    City(id: 10, name: "Boston", description: "A fellow named Jeremy comes from there", latitude: 42.21, longitude: -71.04,  keywords: ["seaside", "sport"],
    locations: [Location(id: 18, type: "restaurant", name: "RestaurantE", rating: 3)]),
    City(id: 11, name: "Seattle", description: "Grunge was born there", latitude: 47.37, longitude: -122.20, keywords: ["seaside", "music"],
    locations: [Location(id: 19, type: "restaurant", name: "RestaurantF", rating: 5)]),
    City(id: 12, name: "Albuquerque", description: "Something about Breaking Bad", latitude: 35.07, longitude: -106.37, keywords: ["party", "hot climate"],
    locations: [Location(id: 20, type: "museum", name: "MuseumG", rating: 2), Location(id: 15, type: "monument", name: "MonumentC", rating: 4)]),
    City(id: 13, name: "Tokyo", description: "Capital of Japan", latitude: 35.41, longitude: 139.42, keywords: ["seaside"],
    locations: [Location(id: 21, type: "pub", name: "PubA", rating: 2)]),
    City(id: 14, name: "Brasilia", description: "Just like the name of the country", latitude: -15.48, longitude: -47.52, keywords: ["jungle", "hot climate"],
    locations: [Location(id: 24, type: "museum", name: "MuseumH", rating: 3)]),
    City(id: 15, name: "Sydney", description: "A lot of spiders there", latitude: -33.52, longitude: 151.13, keywords: ["seaside", "hot climate", "music"],
    locations: [Location(id: 25, type: "museum", name: "MuseumI", rating: 3)]),
    City(id: 16, name: "Auckland", description: "Kiwis live there", latitude: -36.50, longitude: 174.44, keywords: ["seaside", "hot climate", "nature"],
    locations: [Location(id: 26, type: "museum", name: "MuseumJ", rating: 2)]),
    City(id: 17, name: "Cape Town", description: "That's in Africa", latitude: -33.56, longitude: 18.25, keywords: ["seaside", "hot climate"],
    locations: [Location(id: 27, type: "pub", name: "PubB", rating: 4)]),
    City(id: 18, name: "Buenos Aires", description: "Capital of Argentina", latitude: -34.36, longitude: -58.23, keywords: ["seaside", "sport", "party"],
    locations: [Location(id: 28, type: "pub", name: "PubC", rating: 3), Location(id: 29, type: "pub", name: "PubD", rating: 2), Location(id: 30, type: "monument", name: "MonumentD", rating: 4)]),
    City(id: 19, name: "Paris", description: "Not as nice as they tell", latitude: 48.51, longitude: 2.21, keywords: ["party", "music"],
    locations: [Location(id: 31, type: "museum", name: "MuseumK", rating: 5)]),
]

print("\nCities with name 'Paris':")
for city in searchByName(cityName: "Paris") {
    print("\t" + city.toString(simple: true))
}

print("\nCities with keyword 'sport':")
for city in searchByKeyword(cityKeyword: "sport") {
    print("\t" + city.toString(simple: true))
}

print("\nDistance between Gdansk and Tokyo:")
print(calculateDistance(cityA: cities[0], cityB: cities[13]))

displayClosestAndFurthest(userLongitude: 0.0, userLatitude: 0.0)

displayTwoFurthest()

displayCitiesWith5StarRestaurants()

print("\nLocations in Buenos Aires sorted by rating:")
for location in getSortedLocations(cityA: cities[18]) {
    print("\t" + location.toString())
}

displayCitiesWith5StarLocations()