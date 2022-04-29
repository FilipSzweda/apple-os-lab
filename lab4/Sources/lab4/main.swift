// Facebook

enum Access: String {
    case PA = "Public access"
    case FA = "Friends-only access"
    case SFA = "Specific friends-only access"
    case EFA = "Exceptional friends-only access"
    case MA = "Me-only access"
}

class Date {
    var day: Int
    var month: Int
    var year: Int
    init(day: Int, month: Int, year: Int){
      self.day = day
      self.month = month
      self.year = year
    }
    func toString() -> String {
        return "\(day).\(month).\(year)"
    }
}

class Content {
    var txt: String
    var img: String
    var vid: String
    var date: Date
    var reaction: Reaction
    init(txt: String, img: String, vid: String, date: Date, reaction: Reaction){
      self.txt = txt
      self.img = img
      self.vid = vid
      self.date = date
      self.reaction = reaction
    }
}

class Comment: Content {
    var user: User
    var author: Bool
    init(txt: String, img: String, vid: String, date: Date, reaction: Reaction, user: User, author: Bool){
        self.user = user
        self.author = author
        super.init(txt: txt, img: img, vid: vid, date: date, reaction: reaction)
    }
    func show() {
        if(author) {
            print("\t\tAuthor:\n")
        }
        print("\t\tName: " + user.name)
        print("\t\tSurname: " + user.surname)
        if(txt.count > 0) {
            print("\t\tText: " + txt)
        }
        if(img.count > 0) {
            print("\t\tImg: " + img)
        }
        if(vid.count > 0) {
            print("\t\tVid: " + vid)
        }
        print("\t\tDate: " + date.toString())
        print("\t\tReaction:")
        reaction.showCom()
    }
}

struct Reaction {
    var nbLike: Int
    var nbLove: Int
    var nbHaha: Int
    var nbWow: Int
    var nbSad: Int
    var nbAngry: Int
    init(nbLike: Int, nbLove: Int, nbHaha: Int, nbWow: Int, nbSad: Int, nbAngry: Int){
      self.nbLike = nbLike
      self.nbLove = nbLove
      self.nbHaha = nbHaha
      self.nbWow = nbWow
      self.nbSad = nbSad
      self.nbAngry = nbAngry
    }
    func show() {
        print("\t👍: \(nbLike) ❤️: \(nbLove) 😂: \(nbHaha) 😯: \(nbWow) 😢: \(nbSad) 😡: \(nbAngry)")
    }
    func showCom() {
        print("\t\t👍: \(nbLike) ❤️: \(nbLove) 😂: \(nbHaha) 😯: \(nbWow) 😢: \(nbSad) 😡: \(nbAngry)")
    }
}

class Post: Content {
    var access: Access
    var comments: [Comment] = []
    init(txt: String, img: String, vid: String, date: Date, reaction: Reaction, access: Access, comments: [Comment]){
        self.access = access
        self.comments = comments
        super.init(txt: txt, img: img, vid: vid, date: date, reaction: reaction)
    }
    func show() {
        print("\tAccess: " + access.rawValue)
        if(txt.count > 0) {
            print("\tText: " + txt)
        }
        if(img.count > 0) {
            print("\tImg: " + img)
        }
        if(vid.count > 0) {
            print("\tVid: " + vid)
        }
        print("\tDate: " + date.toString())
        print("\tReaction:")
        reaction.show()
        print("\tComments:")
        for comment in comments {
            comment.show()
        }
    }
}

struct User {
    var name: String
    var surname: String
    var posts: [Post] = []
    init(name: String, surname: String, posts: [Post]){
        self.name = name
        self.surname = surname
        self.posts = posts
    }
    func show() {
        print("Name: " + name)
        print("Surname: " + surname)
        print("Posts:")
        for post in posts {
            post.show()
        }
    }
}

var users: [User] = [
    User(name: "Jan", surname: "Kowalski", posts: [
        Post(txt: "Post1", img: "", vid: "", date: Date(day: 26, month: 4, year: 2022), reaction: Reaction(nbLike: 12, nbLove: 2, nbHaha: 4, nbWow: 1, nbSad: 8, nbAngry: 5), access: Access.FA, comments: [
            Comment(txt: "Komentarz1", img: "", vid: "", date: Date(day: 26, month: 4, year: 2022), reaction: Reaction(nbLike: 1, nbLove: 1, nbHaha: 3, nbWow: 1, nbSad: 10, nbAngry: 2), user: User(name: "Krzysztof", surname: "Treppa", posts: []), author: false) 
        ]),
        Post(txt: "", img: "https://pg.edu.pl/themes/custom/politechnika_gdanska/images/pg-logotyp.svg", vid: "", date: Date(day: 29, month: 4, year: 2022), reaction: Reaction(nbLike: 12, nbLove: 32, nbHaha: 42, nbWow: 13, nbSad: 81, nbAngry: 52), access: Access.PA, comments: [
            Comment(txt: "Komentarz2", img: "", vid: "", date: Date(day: 30, month: 4, year: 2022), reaction: Reaction(nbLike: 12, nbLove: 2, nbHaha: 4, nbWow: 1, nbSad: 38, nbAngry: 25), user: User(name: "Szymon", surname: "Śmigała", posts: []), author: false) 
        ])
    ]),
    User(name: "Jakub", surname: "Nowak", posts: [
        Post(txt: "Post3", img: "", vid: "", date: Date(day: 27, month: 4, year: 2022), reaction: Reaction(nbLike: 12, nbLove: 2, nbHaha: 444, nbWow: 21, nbSad: 8, nbAngry: 5), access: Access.SFA, comments: [
            Comment(txt: "Komentarz3", img: "", vid: "", date: Date(day: 26, month: 4, year: 2022), reaction: Reaction(nbLike: 122, nbLove: 12, nbHaha: 14, nbWow: 1, nbSad: 8, nbAngry: 25), user: User(name: "Piotr", surname: "Koperski", posts: []), author: false) 
        ])
    ])
]

for user in users {
    user.show()
}