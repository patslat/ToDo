User.create(name: "patrick", password: "123")
User.create(name: "Socrates", password: "123")
User.create(name: "Plato", password: "123")
User.create(name: "Aristophanes", password: "123")
User.create(name: "Nietzsche", password: "123")
User.create(name: "Kierkegaard", password: "123")
User.create(name: "Camus", password: "123")
User.create(name: "Dostoevsky", password: "123")
User.create(name: "Murakami", password: "123")
User.create(name: "Heraclitus", password: "123")

Team.create(name: "Philosophers", teammate_ids: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
Team.create(name: "Greeks", teammate_ids: [1, 2, 3, 4, 10])
Team.create(name: "Existentialists", teammate_ids: [1, 4, 5, 6, 7])