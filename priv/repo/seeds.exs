# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bookworm.Repo.insert!(%Bookworm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Bookworm.Books

books = [
  %{
    title: "Atlas Shrugged",
    authors: "Ayn Rand",
    description:
      "Peopled by larger-than-life heroes and villains, charged with towering questions of good and evil, Atlas Shrugged is Ayn Rand’s magnum opus: a philosophical revolution told in the form of an action thriller—nominated as one of America’s best-loved novels by PBS’s The Great American Read.",
    thumbnail:
      "https://images-na.ssl-images-amazon.com/images/I/51ADlvbdzOL._SX332_BO1,204,203,200_.jpg",
    rating: 3
  },
  %{
    title: "The Giver",
    authors: "Lois Lowry",
    description:
      "The Giver, the 1994 Newbery Medal winner, has become one of the most influential novels of our time. The haunting story centers on twelve-year-old Jonas, who lives in a seemingly ideal, if colorless, world of conformity and contentment. Not until he is given his life assignment as the Receiver of Memory does he begin to understand the dark, complex secrets behind his fragile community. Lois Lowry has written three companion novels to The Giver, including Gathering Blue, Messenger, and Son.",
    thumbnail:
      "https://images-na.ssl-images-amazon.com/images/I/51UsRhmuBkL._SX331_BO1,204,203,200_.jpg",
    rating: 4
  },
  %{
    title: "The Alchemist",
    authors: "Paulo Coelho",
    description:
      "Paulo Coelho's masterpiece tells the mystical story of Santiago, an Andalusian shepherd boy who yearns to travel in search of a worldly treasure. His quest will lead him to riches far different—and far more satisfying—than he ever imagined. Santiago's journey teaches us about the essential wisdom of listening to our hearts, of recognizing opportunity and learning to read the omens strewn along life's path, and, most importantly, to follow our dreams.",
    thumbnail:
      "https://images-na.ssl-images-amazon.com/images/I/516c6gUQLaL._SX329_BO1,204,203,200_.jpg",
    rating: 5
  },
  %{
    title: "East of Eden",
    authors: "John Steinbeck",
    description:
      "Set in the rich farmland of California's Salinas Valley, this sprawling and often brutal novel follows the intertwined destinies of two families—the Trasks and the Hamiltons—whose generations helplessly reenact the fall of Adam and Eve and the poisonous rivalry of Cain and Abel.",
    thumbnail:
      "https://images-na.ssl-images-amazon.com/images/I/51lyRmiBA0L._SX325_BO1,204,203,200_.jpg",
    rating: 2
  },
  %{
    title:
      "How to Make a Spaceship: A Band of Renegades, an Epic Race, and the Birth of Private Spaceflight",
    authors: "Julian Guthrie",
    description:
      "The story of the bullet-shaped SpaceShipOne, and the other teams in the hunt, is an extraordinary tale of making the impossible possible. It is driven by outsized characters—Burt Rutan, Richard Branson, John Carmack, Paul Allen—and obsessive pursuits. In the end, as Diamandis dreamed, the result wasn’t just a victory for one team; it was the foundation for a new industry and a new age.",
    thumbnail:
      "https://images-na.ssl-images-amazon.com/images/I/51jYpEP273L._SX324_BO1,204,203,200_.jpg",
    rating: 3
  },
  %{
    title:
      "Creativity, Inc.: Overcoming the Unseen Forces That Stand in the Way of True Inspiration",
    authors: "Ed Catmull and Amy Wallace",
    description:
      "For nearly twenty years, Pixar has dominated the world of animation, producing such beloved films as the Toy Story trilogy, Monsters, Inc., Finding Nemo, The Incredibles, Up, WALL-E, and Inside Out, which have gone on to set box-office records and garner thirty Academy Awards. The joyousness of the storytelling, the inventive plots, the emotional authenticity: In some ways, Pixar movies are an object lesson in what creativity really is. Here, in this book, Catmull reveals the ideals and techniques that have made Pixar so widely admired—and so profitable.",
    thumbnail:
      "https://images-na.ssl-images-amazon.com/images/I/41xzn-l9yPL._SX327_BO1,204,203,200_.jpg",
    rating: 1
  }
]

Enum.each(books, fn book ->
  Books.create_book(book)
end)
