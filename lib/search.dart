import 'package:day_31_with_flutter/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static List<MovieModel> movieList = [
    MovieModel(
      "The Shawshank Redemption",
      1994,
      9.3,
      "https://i.pinimg.com/236x/06/25/43/06254300619f09941229da40c152a22f.jpg",
    ),
    MovieModel(
      "The Godfather",
      1972,
      9.2,
      "https://i.pinimg.com/236x/11/99/dc/1199dc6273680f175fd9b06c9c36d08a.jpg",
    ),
    MovieModel(
      "The Dark Knight",
      2008,
      9.0,
      "https://i.pinimg.com/236x/31/8d/07/318d07a48fb6f063a5b01c4b0a0f5416.jpg",
    ),
    MovieModel(
      "The Godfather II",
      1974,
      9.0,
      "https://i.pinimg.com/236x/6c/92/a7/6c92a7aefc3cda63f27d234d714d9fe7.jpg",
    ),
    MovieModel(
      "12 Angry Men",
      1957,
      9.0,
      "https://i.pinimg.com/236x/ca/38/da/ca38dacb6584c1eb204b052b6ee796cf.jpg",
    ),
    MovieModel(
      "Schindler's List",
      1993,
      9.0,
      "https://i.pinimg.com/236x/8b/64/83/8b648309a99984686519314731b56ea1.jpg",
    ),
    MovieModel(
      "The Lord of the Rings: The Return of the king",
      2003,
      8.9,
      "https://i.pinimg.com/236x/7b/6d/38/7b6d3896048f20a865b744ab69aaf216.jpg",
    ),
    MovieModel(
      "Pulp Fiction",
      1994,
      8.9,
      "https://i.pinimg.com/236x/f0/01/3c/f0013ca4a05245afde43e0eaa7d1a2ce.jpg",
    ),
    MovieModel(
      "The Lord of the Rings: The Fellowship of the Ring",
      2001,
      8.8,
      "https://i.pinimg.com/236x/28/84/d3/2884d3f2428ae0937aa89c8d5d2d2485.jpg",
    ),
  ];

  List<MovieModel> displayList = List.from(movieList);
  void updateList(String value) {
    setState(() {
      displayList = movieList
          .where((element) =>
              element.mTitle!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search for a Movie",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .3,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => updateList(value),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff302360),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "eg: The Dark Knight",
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.purple.shade900),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: displayList.length == 0
                    ? Center(
                        child: Text(
                        "No result found",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: displayList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                              displayList[index].mPosterUrl.toString(),
                            ),
                            title: Text(
                              displayList[index].mTitle.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              displayList[index].mreleaseYear.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            trailing: Text(
                              displayList[index].rating.toString(),
                              style: TextStyle(
                                color: Colors.yellow[900],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
