import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // [4]
      appBar: AppBar(title: const Text("สัตว์โลกน่ารัก")),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  // loop using index , contex use for load json data
                  return myBox(data[index]['title'], data[index]['discription'],
                      data[index]['picture'], data[index]['detail']);
                },
                itemCount: data.length,
              );
            },
            future:
                DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
    );
  }

  Widget myBox(
      String title, String discription, String picture, String detail) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(picture),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35), BlendMode.darken))
          //color: Colors.blue[50]
          ,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 35,
                fontFamily: 'mmh',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 183, 255)),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            discription,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: 'mmh',
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          const SizedBox(
            height: 3,
          ),
          TextButton(
              onPressed: () {
                //debugPrint("Detail >>>");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(title, discription, picture, detail),
                    ));
              },
              child: const Text(
                "More",
                style: TextStyle(color: Color.fromARGB(255, 11, 255, 182)),
              ))
        ],
      ),
    );
  }
}
