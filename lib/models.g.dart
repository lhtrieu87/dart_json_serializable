// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) => new People(
    json['name'] as String,
    (json['species'] as List)?.map((e) => e as String)?.toList());

abstract class _$PeopleSerializerMixin {
  String get name;
  List<String> get species;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'species': species};
}

PeopleResponse _$PeopleResponseFromJson(Map<String, dynamic> json) =>
    new PeopleResponse((json['results'] as List)
        ?.map((e) =>
            e == null ? null : new People.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$PeopleResponseSerializerMixin {
  List<People> get results;
  Map<String, dynamic> toJson() => <String, dynamic>{'results': results};
}
