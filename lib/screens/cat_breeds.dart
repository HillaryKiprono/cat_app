import 'dart:convert';

import 'package:flutter/material.dart';

import '../api/cat_api.dart';
import '../models/cats.dart';
import 'cat_info.dart';

class CatBreedsPage extends StatefulWidget {
  const CatBreedsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CatBreedsPage> createState() => _CatBreedsPageState();
}

class _CatBreedsPageState extends State<CatBreedsPage> {
  BreedList breedList = BreedList(breeds: List.empty());

  void getCatData() async {
    final catJson = await CatAPI().getCatBreeds();
    print(catJson);
    final dynamic catMap = json.decode(catJson);
    setState(() {
      breedList = BreedList.fromJson(catMap);
    });
  }

  @override
  void initState() {
    super.initState();
    getCatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: breedList.breeds.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push<void>(context,
                    MaterialPageRoute(builder: (context) {
                      return CatInfo(
                        catId: breedList.breeds[index].id,
                        catBreed: breedList.breeds[index].name,
                      );
                    }));

              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(breedList.breeds[index].name),
                    subtitle: Text(breedList.breeds[index].description),
                  ),
                ),
              ),
            );
          }),
    );
  }
}