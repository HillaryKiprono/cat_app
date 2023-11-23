
import 'dart:convert';
import 'package:flutter/material.dart';
import '../api/cat_api.dart';
import '../models/cats.dart';

class CatInfo extends StatefulWidget {
  final String catBreed;
  final String catId;

  const CatInfo({super.key, required this.catBreed, required this.catId});

  @override
  State<CatInfo> createState() => _CatInfoState();
}

class _CatInfoState extends State<CatInfo> {
  CatList catList = CatList(breeds: List.empty());

  void getCatData() async {
    final catJson = await CatAPI().getCatBreed(widget.catId);

    final dynamic catMap = json.decode(catJson);

    setState(() {
      catList = CatList.fromJson(catMap);
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
          // Here we take the value from the MyHomePage object that was created
          // by the App.build method, and use it to set our appbar title.
          title: Text(widget.catBreed),
        ),
        body: getCat());
  }

  Widget getCat() {
    final mediaSize = MediaQuery.of(context).size;
    if (catList.breeds.isEmpty) {
      return Container();
    } else {
      return Center(
        child: Container(
            width: mediaSize.width,
            height: mediaSize.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(catList.breeds[0].url),
                fit: BoxFit.contain,
              ),
            )),
      );
    }
  }
}