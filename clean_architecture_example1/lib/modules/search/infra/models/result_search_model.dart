import 'dart:convert';

import 'package:clean_architecture_example1/modules/search/domain/entities/result_serach.dart';

class ResultSearchModel extends ResultSearch {
  final String login;
  // ignore: non_constant_identifier_names
  final String node_id;
  // ignore: non_constant_identifier_names
  final String avatar_url;

  ResultSearchModel(this.login, this.node_id, this.avatar_url);

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'node_id': node_id,
      'avatar_url': avatar_url,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      map['login'],
      map['node_id'],
      map['avatar_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
