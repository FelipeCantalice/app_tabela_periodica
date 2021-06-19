import 'dart:convert';

class ElementoQuimico {
  final String atomicMass;
  final int atomicNumber;
  final int? atomicRadius;
  final int? boilingPoint;
  final String bondingType;
  final String cpkHexColor;
  final double? density;
  final int? electronAffinity;
  final double? electronegativity;
  final String electronicConfiguration;
  final String groupBlock;
  final String ionRadius;
  final int? ionizationEnergy;
  final int? meltingPoint;
  final String name;
  final int? oxidationStates;
  final String standardState;
  final String symbol;
  final int? vanDelWaalsRadius;
  final int? yearDiscovered;
  ElementoQuimico({
    required this.atomicMass,
    required this.atomicNumber,
    required this.atomicRadius,
    required this.boilingPoint,
    required this.bondingType,
    required this.cpkHexColor,
    required this.density,
    required this.electronAffinity,
    this.electronegativity,
    required this.electronicConfiguration,
    required this.groupBlock,
    required this.ionRadius,
    required this.ionizationEnergy,
    required this.meltingPoint,
    required this.name,
    required this.oxidationStates,
    required this.standardState,
    required this.symbol,
    required this.vanDelWaalsRadius,
    required this.yearDiscovered,
  });

  Map<String, dynamic> toMap() {
    return {
      'atomicMass': atomicMass,
      'atomicNumber': atomicNumber,
      'atomicRadius': atomicRadius,
      'boilingPoint': boilingPoint,
      'bondingType': bondingType,
      'cpkHexColor': cpkHexColor,
      'density': density,
      'electronAffinity': electronAffinity,
      'electronegativity': electronegativity,
      'electronicConfiguration': electronicConfiguration,
      'groupBlock': groupBlock,
      'ionRadius': ionRadius,
      'ionizationEnergy': ionizationEnergy,
      'meltingPoint': meltingPoint,
      'name': name,
      'oxidationStates': oxidationStates,
      'standardState': standardState,
      'symbol': symbol,
      'vanDelWaalsRadius': vanDelWaalsRadius,
      'yearDiscovered': yearDiscovered,
    };
  }

  factory ElementoQuimico.fromMap(Map<String, dynamic> map) {
    return ElementoQuimico(
      atomicMass: map['atomicMass'].toString(),
      atomicNumber: map['atomicNumber'],
      atomicRadius: int.tryParse(map['atomicRadius'].toString()),
      boilingPoint: int.tryParse(map['boilingPoint'].toString()),
      bondingType: map['bondingType'],
      cpkHexColor: map['cpkHexColor'].toString(),
      density: double.tryParse(map['density'].toString()),
      electronAffinity: int.tryParse(map['electronAffinity'].toString()),
      electronegativity: double.tryParse(map['electronegativity'].toString()),
      electronicConfiguration: map['electronicConfiguration'],
      groupBlock: map['groupBlock'],
      ionRadius: map['ionRadius'],
      ionizationEnergy: int.tryParse(map['ionizationEnergy'].toString()),
      meltingPoint: int.tryParse(map['meltingPoint'].toString()),
      name: map['name'],
      oxidationStates: int.tryParse(map['oxidationStates'].toString()),
      standardState: map['standardState'],
      symbol: map['symbol'],
      vanDelWaalsRadius: int.tryParse(map['vanDelWaalsRadius'].toString()),
      yearDiscovered: int.tryParse(map['yearDiscovered'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory ElementoQuimico.fromJson(String source) =>
      ElementoQuimico.fromMap(json.decode(source));
}
