import 'dart:convert';

// To parse this JSON data, do
//
//     final elementoQuimico = elementoQuimicoFromMap(jsonString);

List<ElementoQuimico> elementoQuimicoFromMap(String str) =>
    List<ElementoQuimico>.from(
        json.decode(str).map((x) => ElementoQuimico.fromMap(x)));

String elementoQuimicoToMap(List<ElementoQuimico> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ElementoQuimico {
  ElementoQuimico({
    required this.name,
    required this.appearance,
    required this.atomicMass,
    required this.boil,
    required this.category,
    required this.color,
    required this.density,
    required this.discoveredBy,
    required this.melt,
    required this.molarHeat,
    required this.namedBy,
    required this.number,
    required this.period,
    required this.phase,
    required this.source,
    required this.spectralImg,
    required this.summary,
    required this.symbol,
    required this.xpos,
    required this.ypos,
    required this.shells,
    required this.electronConfiguration,
    required this.electronConfigurationSemantic,
    required this.electronAffinity,
    required this.electronegativityPauling,
    required this.ionizationEnergies,
    required this.cpkHex,
  });

  final String? name;
  final String? appearance;
  final double? atomicMass;
  final double? boil;
  final String? category;
  final String? color;
  final double? density;
  final String? discoveredBy;
  final double? melt;
  final double? molarHeat;
  final String? namedBy;
  final int? number;
  final int? period;
  final Phase? phase;
  final String? source;
  final String? spectralImg;
  final String? summary;
  final String? symbol;
  final int? xpos;
  final int? ypos;
  final List<int>? shells;
  final String? electronConfiguration;
  final String? electronConfigurationSemantic;
  final double? electronAffinity;
  final double? electronegativityPauling;
  final List<double>? ionizationEnergies;
  final String? cpkHex;

  factory ElementoQuimico.fromMap(Map<String, dynamic> json) => ElementoQuimico(
        name: json["name"] == null ? null : json["name"],
        appearance: json["appearance"] == null ? null : json["appearance"],
        atomicMass:
            json["atomic_mass"] == null ? null : json["atomic_mass"].toDouble(),
        boil: json["boil"] == null ? null : json["boil"].toDouble(),
        category: json["category"] == null ? null : json["category"],
        color: json["color"] == null ? null : json["color"],
        density: json["density"] == null ? null : json["density"].toDouble(),
        discoveredBy:
            json["discovered_by"] == null ? null : json["discovered_by"],
        melt: json["melt"] == null ? null : json["melt"].toDouble(),
        molarHeat:
            json["molar_heat"] == null ? null : json["molar_heat"].toDouble(),
        namedBy: json["named_by"] == null ? null : json["named_by"],
        number: json["number"] == null ? null : json["number"],
        period: json["period"] == null ? null : json["period"],
        phase: null,
        source: json["source"] == null ? null : json["source"],
        spectralImg: json["spectral_img"] == null ? null : json["spectral_img"],
        summary: json["summary"] == null ? null : json["summary"],
        symbol: json["symbol"] == null ? null : json["symbol"],
        xpos: json["xpos"] == null ? null : json["xpos"],
        ypos: json["ypos"] == null ? null : json["ypos"],
        shells: json["shells"] == null
            ? null
            : List<int>.from(json["shells"].map((x) => x)),
        electronConfiguration: json["electron_configuration"] == null
            ? null
            : json["electron_configuration"],
        electronConfigurationSemantic:
            json["electron_configuration_semantic"] == null
                ? null
                : json["electron_configuration_semantic"],
        electronAffinity: json["electron_affinity"] == null
            ? null
            : json["electron_affinity"].toDouble(),
        electronegativityPauling: json["electronegativity_pauling"] == null
            ? null
            : json["electronegativity_pauling"].toDouble(),
        ionizationEnergies: json["ionization_energies"] == null
            ? null
            : List<double>.from(
                json["ionization_energies"].map((x) => x.toDouble())),
        cpkHex: json["cpk-hex"] == null ? null : json["cpk-hex"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "appearance": appearance == null ? null : appearance,
        "atomic_mass": atomicMass == null ? null : atomicMass,
        "boil": boil == null ? null : boil,
        "category": category == null ? null : category,
        "color": color == null ? null : color,
        "density": density == null ? null : density,
        "discovered_by": discoveredBy == null ? null : discoveredBy,
        "melt": melt == null ? null : melt,
        "molar_heat": molarHeat == null ? null : molarHeat,
        "named_by": namedBy == null ? null : namedBy,
        "number": number == null ? null : number,
        "period": period == null ? null : period,
        "phase": null,
        "source": source == null ? null : source,
        "spectral_img": spectralImg == null ? null : spectralImg,
        "summary": summary == null ? null : summary,
        "symbol": symbol == null ? null : symbol,
        "xpos": xpos == null ? null : xpos,
        "ypos": ypos == null ? null : ypos,
        "shells":
            shells == null ? null : List<dynamic>.from(shells!.map((x) => x)),
        "electron_configuration":
            electronConfiguration == null ? null : electronConfiguration,
        "electron_configuration_semantic": electronConfigurationSemantic == null
            ? null
            : electronConfigurationSemantic,
        "electron_affinity": electronAffinity == null ? null : electronAffinity,
        "electronegativity_pauling":
            electronegativityPauling == null ? null : electronegativityPauling,
        "ionization_energies": ionizationEnergies == null
            ? null
            : List<dynamic>.from(ionizationEnergies!.map((x) => x)),
        "cpk-hex": cpkHex == null ? null : cpkHex,
      };
}

enum Phase { GAS, SOLID, LIQUID }

final phaseValues = EnumValues(
    {"Gas": Phase.GAS, "Liquid": Phase.LIQUID, "Solid": Phase.SOLID});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
