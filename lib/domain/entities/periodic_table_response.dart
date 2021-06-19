import 'dart:convert';

import 'elemento_quimico.dart';

class PeriodicTableResponse {
  final List<ElementoQuimico> data;
  PeriodicTableResponse({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory PeriodicTableResponse.fromMap(Map<String, dynamic> map) {
    return PeriodicTableResponse(
      data: List<ElementoQuimico>.from(map['data']?.map((x) => ElementoQuimico.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PeriodicTableResponse.fromJson(String source) => PeriodicTableResponse.fromMap(json.decode(source));
}
