import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final v1, v2, v3, v4;
  DetailPage(this.v1,this.v2,this.v3,this.v4);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _v1, _v2, _v3, _v4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("แนะนำตัว")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Text(_v1,style: const TextStyle(fontFamily: 'mmh',fontSize: 50),),
            Text(_v2,style: const TextStyle(fontFamily: 'mmh',fontSize: 30,color: Colors.grey) ,),
            Image.network(_v3),
            Text(_v4,style: const TextStyle(fontFamily: 'mmh',fontSize: 20))
          ],
        ),
      ),
    );
  }
}
