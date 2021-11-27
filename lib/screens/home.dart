import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonapp/Models/pokemonmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    //here we are getting json data
    var d = await Dio().get(url);

    // here json data in coverted to Map
    var data = jsonDecode(d.data);

    // extracting list from Map
    List datalist = data["pokemon"];

    for (var pokemon in datalist) {
      // creating ob of Pokemon
      Pokemon? ob;

      // calling constructor for initliized member variables
      ob = Pokemon.fromMap(pokemon);

      // calling toMap for extracting data for member variables
      ob.toMap();
      // ok
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              // centerTitle: true,
              backgroundColor: Colors.blueAccent,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Pokemon App",
                ),
                centerTitle: true,
                background: FlutterLogo(),
              ),
              expandedHeight: 200.0,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    child: (Pokemon.l != null)
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 200.0,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 20.0,
                              ),
                              itemBuilder: (context, index) {
                                return PokemonCard(Pokemon.l[index], context);
                              },
                              itemCount: Pokemon.l.length,
                            ),
                          )
                        : const Center(
                            child: LinearProgressIndicator(),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget PokemonCard(Pokemon item, context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Text(
            "${item.name}",
            style: GoogleFonts.lato(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          CachedNetworkImage(
            imageUrl: item.img!,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(
            "${item.nume}",
            style: GoogleFonts.lato(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
