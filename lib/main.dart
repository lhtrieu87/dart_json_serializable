import 'dart:convert';
import 'dart:io';

import 'package:example_json_serializable/models.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SWAPI',
      home: new PeopleListView(),
      theme: new ThemeData(primaryColor: Colors.blue),
    );
  }
}

class PeopleListView extends StatefulWidget {
  @override
  createState() => new PeopleListState();
}

class PeopleListState extends State<PeopleListView> {
  List<People> _people = new List<People>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    _getPeopleList();
  }

  _getPeopleList() async {
    final url = 'https://swapi.co/api/people/';
    final httpClient = new HttpClient();

    try {
      final HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      final HttpClientResponse response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        final String json = await response.transform(UTF8.decoder).join();
        PeopleResponse peopleResponse = new PeopleResponse.fromJson(
            JSON.decode(json));
        setState(() {
          _people = peopleResponse.results;
        });
      }
    }
    catch
    (
    exception
    ) {
      print(exception);
    }
  }

  Widget _buildPeopleList() {
    return new ListView.builder(padding: const EdgeInsets.all(16.0),
        itemCount: _people.length,
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;

          return _buildRow(_people[index]);
        });
  }

  Widget _buildRow(People person) {
    return new ListTile(
      title: new Text(person.name, style: _biggerFont,),
      subtitle: person.species.length > 0 ? new Text(person.species[0]) : new
      Text(''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('SWAPI')),
      body: _buildPeopleList(),);
  }
}