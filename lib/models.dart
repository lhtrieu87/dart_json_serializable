library models;

import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class People extends Object with _$PeopleSerializerMixin {
  final String name;
  final List<String> species;

  People(this.name, this.species);

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);

  bool operator ==(other) {
    Function eq = const ListEquality().equals;
    return (other is People && other.name == name && eq(other.species,
        species));
  }
}

@JsonSerializable()
class PeopleResponse extends Object with _$PeopleResponseSerializerMixin {
  final List<People> results;

  PeopleResponse(this.results);

  factory PeopleResponse.fromJson(Map<String, dynamic> json) =>
      _$PeopleResponseFromJson(json);
}