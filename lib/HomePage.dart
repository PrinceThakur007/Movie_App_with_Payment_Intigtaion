import 'package:flutter/material.dart';
import 'package:the_movie/HomePage.dart';
import 'package:the_movie/Movie.dart';
import 'package:the_movie/MyCard.dart';
import 'package:the_movie/SecondScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sort_value = "time";
  var sortingByList = ["rating", "time"];

  var filterByList = ['all', "action", "fantacy", "thriller", "romantic"];

  var filter_value = "all";
  List<Movie> listOfMovies;

  List<Movie> filterMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listOfMovies = new List();
    filterMovies = new List();

    listOfMovies.add(Movie(
        name: "Iron Man",
        description:
            "When Tony Stark, an industrialist, is captured, he constructs a high-tech armoured suit to escape. Once he manages to escape, he decides to use his suit to fight against evil forces to save the world.",
        caegory: "action",
        release_date: 1598950467147,
        movie_image: 'photo/ironman.jpg',
        price: 1000,
        rating: 1));

    listOfMovies.add(Movie(
        name: "Harry Potter",
        description:
            "Harry Potter is a film series based on the eponymous novels by author J. K. Rowling. The series is distributed by Warner Bros. and consists of eight fantasy films",
        caegory: "fantacy",
        release_date: 1598812200000,
        movie_image: 'photo/harry_potter.jpg',
        price: 1000,
        rating: 5));

    listOfMovies.add(Movie(
      name: "Batman",
      description:
          "Batman is a fictional superhero appearing in American comic books published by DC Comics. The character was created by artist Bob Kane and writer Bill Finger, and first appeared in Detective Comics #27 in 1939.",
      caegory: "action",
      release_date: 1597861800000,
      movie_image: 'photo/batman.jpg',
      price: 1000,
      rating: 4,
    ));

    listOfMovies.add(Movie(
        name: "Fifty Shades of Grey",
        description:
            "Fifty Shades is an American film trilogy series that consists of three erotic romantic drama films, based on the Fifty Shades trilogy by English author E. L. James.",
        caegory: "romantic",
        release_date: 1598964197467,
        movie_image: 'photo/fifity.jpg',
        price: 1000,
        rating: 3.5));

    listOfMovies.add(Movie(
        name: "It Chapter Two",
        description:
            "Defeated by members of the Losers' Club, the evil clown Pennywise returns 27 years later to terrorize the town of Derry, Maine, once again.",
        caegory: "thriller",
        release_date: 1598964236601,
        movie_image: 'photo/it2.jpg',
        price: 1000,
        rating: 3));

    // listOfMovies.add(Movie(
    //     name: "Inception",
    //     description:
    //         " A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O. ",
    //     caegory: "action",
    //     release_date: 1597970405000,
    //     movie_image: 'photo/inception.jpg',
    //     price: 1000,
    //     rating: 4.2));
    // listOfMovies.add(Movie(
    //     name: "Joker",
    //     description:
    //         "In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. ",
    //     caegory: "thriller",
    //     release_date: 1598316005000,
    //     movie_image: 'photo/joker.jpg',
    //     price: 1000,
    //     rating: 4.6));
    // listOfMovies.add(Movie(
    //     name: "Black Panther",
    //     description:
    //         "T'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country's past.",
    //     release_date: 1597538405000,
    //     movie_image: 'photo/black_panther.jpg',
    //     price: 1000,
    //     caegory: "action",
    //     rating: 4.6));
    listOfMovies.add(Movie(
        name: "Me Before You",
        description:
            "A girl in a small town forms an unlikely bond with a recently-paralyzed man she's taking care of. ",
        release_date: 1598575205000,
        movie_image: 'photo/me_before_you.jpg',
        price: 1000,
        caegory: "romantic",
        rating: 2.6));

    filterMovies = listOfMovies;
  }

  void _filterMovies(String value) {
    setState(() {
      filterMovies = listOfMovies
          .where((element) => element.getCategory() == value)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // listOfMovies.sort((a, b) => a.getPrice().compareTo(
    //       b.getPrice(),
    //     ));
    // listOfMovies.sort((a, b) => a.getRating().compareTo(
    //       b.getRating(),
    //     ));

    print(DateTime.now().millisecondsSinceEpoch);
    // _filterMovies();
    return Container(
      color: Color.fromARGB(0xFF, 0x1F, 0x25, 0x33),
      child: Column(
        children: [
          // Container(
          //   child: Image.asset('photo/batman.jpg'),
          //   height: 200,
          //   width: 200,
          // ),
          Expanded(
            child: Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Filter By",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    DropdownButton<String>(
                      dropdownColor: Color.fromARGB(0XFF, 0x33, 0x35, 0x45),
                      items: filterByList.map(
                        (String value) {
                          return DropdownMenuItem<String>(
                            child: new Text(
                              value,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            value: value,
                          );
                        },
                      ).toList(),
                      onChanged: (String value) {
                        filter_value = value;
                        filterDataMethod(value);
                      },
                      value: filter_value,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Sort By",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      DropdownButton<String>(
                        dropdownColor: Color.fromARGB(0XFF, 0x33, 0x35, 0x45),
                        items: sortingByList.map(
                          (String value) {
                            return DropdownMenuItem<String>(
                              child: new Text(
                                value,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              value: value,
                            );
                          },
                        ).toList(),
                        onChanged: (String value) {
                          sort_value = value;
                          switchData(value, listOfMovies);
                        },
                        value: sort_value,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.79,
            width: MediaQuery.of(context).size.width * 0.95,
            color: Colors.transparent,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                Movie obj = filterMovies[index];

                return GestureDetector(
                  child: MyCard(
                      obj.getName(),
                      obj.getDescription(),
                      obj.getCategory(),
                      obj.getReleaseDate(),
                      obj.getPrice(),
                      obj.getRating(),
                      obj.getImage()),
                  onTap: () {
                    print(obj.getName());

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SecondScreen(obj: obj)));
                  },
                );
                // return ListTile(
                //   title: Text(obj.getName()),
                //   subtitle: Text(obj.getDescription()),
                // );
              },
              itemCount: filterMovies.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  void switchData(String value, List listOfMovies) {
    switch (value) {
      case 'time':
        {
          filterMovies.sort((a, b) => a.getReleaseDate().compareTo(
                b.getReleaseDate(),
              ));

          Movie obj = listOfMovies[0];
          setState(() {
            print("Data is Price " +
                obj.getName() +
                "  " +
                obj.getPrice().toString());
          });
        }
        break;

      case 'rating':
        {
          filterMovies.sort((a, b) => a.getRating().compareTo(
                b.getRating(),
              ));
          Movie obj = listOfMovies[0];
          setState(() {
            print("Data is Rating " +
                obj.getName() +
                "  " +
                obj.getRating().toString());
          });
        }
        break;

      default:
        {}
        break;
    }
  }

  void filterDataMethod(String value) {
    switch (value) {
      case 'action':
        {
          _filterMovies('action');
        }
        break;

      case 'thriller':
        {
          _filterMovies('thriller');
        }
        break;
      case 'fantacy':
        {
          _filterMovies('fantacy');
        }
        break;
      case 'romantic':
        {
          _filterMovies('romantic');
        }
        break;
      case 'all':
        {
          filterMovies = listOfMovies;
          setState(() {});
        }
        break;
      default:
        {}
        break;
    }
  }
}
