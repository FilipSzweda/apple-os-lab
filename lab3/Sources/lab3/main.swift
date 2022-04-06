enum IntercardinalDirections {
    case NW
    case NE
    case SW
    case SE
}

struct City {
    let id: Int
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    let direction: IntercardinalDirections
    var keywords: [String] = []
}

var cities: [City] = [
    City(id: 0, name: "Gdansk", description: "GUT is there", latitude: 54.22, longitude: 18.38, direction: IntercardinalDirections.NE, keywords: ["seaside", "music"]),
    City(id: 1, name: "Warsaw", description: "Capital of Poland", latitude: 52.14, longitude: 21.01, direction: IntercardinalDirections.NE, keywords: ["party", "sport"]),
    City(id: 2, name: "Hamburg", description: "Sounds funny if you add -er", latitude: 53.34, longitude: 10.00, direction: IntercardinalDirections.NE, keywords: ["seaside"]),
    City(id: 3, name: "Brussels", description: "I've been there", latitude: 50.51, longitude: 4.21, direction: IntercardinalDirections.NE, keywords: ["party"]),
    City(id: 4, name: "Ljubljana", description: "Difficult to pronounce", latitude: 46.03, longitude: 14.31, direction: IntercardinalDirections.NE, keywords: ["nature"]),
    City(id: 5, name: "Athens", description: "Famous for democracy", latitude: 37.58, longitude: 23.43, direction: IntercardinalDirections.NE, keywords: ["seaside", "ancient"]),
    City(id: 6, name: "Cluj-Napoca", description: "You've probably never heard of it", latitude: 43.46, longitude: 23.35, direction: IntercardinalDirections.NE, keywords: ["hungarian"]),
    City(id: 7, name: "Rome", description: "SPQR", latitude: 41.54, longitude: 12.30, direction: IntercardinalDirections.NE, keywords: ["ancient"]),
    City(id: 8, name: "Stockholm", description: "Seems like a nice place", latitude: 59.20, longitude: 18.04, direction: IntercardinalDirections.NE, keywords: ["seaside", "party"]),
    City(id: 9, name: "Reykjavik", description: "Death Stranding happens here", latitude: 64.08, longitude: 21.56, direction: IntercardinalDirections.NW, keywords: ["seaside", "cold"]),
    City(id: 10, name: "Boston", description: "A fellow called Jeremy comes from there", latitude: 42.21, longitude: 71.04, direction: IntercardinalDirections.NW,  keywords: ["seaside", "sport"]),
    City(id: 11, name: "Seattle", description: "Grunge was born there", latitude: 47.37, longitude: 122.20, direction: IntercardinalDirections.NW, keywords: ["seaside", "music"]),
    City(id: 12, name: "Albuquerque", description: "Something about Breaking Bad", latitude: 35.07, longitude: 106.37, direction: IntercardinalDirections.NW,  keywords: ["party", "hot"]),
    City(id: 13, name: "Tokyo", description: "Capital of Japan", latitude: 35.41, longitude: 139.42, direction: IntercardinalDirections.NE, keywords: []),
    City(id: 14, name: "Brasilia", description: "Just like the name of the country", latitude: 15.48, longitude: 47.52, direction: IntercardinalDirections.SW, keywords: ["jungle", "hot"]),
    City(id: 15, name: "Sydney", description: "A lot of spiders there", latitude: 33.52, longitude: 151.13, direction: IntercardinalDirections.SE, keywords: ["seaside", "hot", "music"]),
    City(id: 16, name: "Auckland", description: "Kiwis live there", latitude: 36.50, longitude: 174.44, direction: IntercardinalDirections.SE, keywords: ["seaside", "hot", "nature"]),
    City(id: 17, name: "Cape Town", description: "That's in Africa", latitude: 33.56, longitude: 18.25, direction: IntercardinalDirections.SE, keywords: ["seaside", "hot"]),
    City(id: 18, name: "Buenos Aires", description: "Capital of Argentina", latitude: 34.36, longitude: 58.23, direction: IntercardinalDirections.SW, keywords: ["seaside", "sport", "party"]),
    City(id: 19, name: "Paris", description: "Not as nice as they tell", latitude: 48.51, longitude: 2.21, direction: IntercardinalDirections.NE, keywords: ["party", "music"]),
]

