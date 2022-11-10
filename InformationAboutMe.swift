struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "User",
            password: "123",
            person: Person.getPerson()
        )
        
    }
}

struct Person {
    let name: String
    let surname: String
    let company: String
    let mood: String
    
    static func getPerson() -> Person {
        Person(
            name: "Данила",
            surname: "Братинов",
            company: "Нет",
            mood: "Счастлив")
    }
}
