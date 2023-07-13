class Pokemon {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final int candyCount;
  final String egg;
  final double spawnChance;
  final int avgSpawns;
  final String spawnTime;
  final List<double> multipliers;
  final List<String> weaknesses;
  final List<NextEvolution> nextEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final List<dynamic> nextEvolutionData = json['nextEvolution'] ?? [];
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'],
      type: List<String>.from(json['type']),
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      candyCount: json['candyCount'],
      egg: json['egg'],
      spawnChance: json['spawnChance'].toDouble(),
      avgSpawns: json['avgSpawns'],
      spawnTime: json['spawnTime'],
      multipliers: List<double>.from(json['multipliers']),
      weaknesses: List<String>.from(json['weaknesses']),
      nextEvolution: nextEvolutionData
          .map((evolution) => NextEvolution.fromJson(evolution))
          .toList(),
    );
  }
}

class NextEvolution {
  final String num;
  final String name;

  NextEvolution({
    required this.num,
    required this.name,
  });

  factory NextEvolution.fromJson(Map<String, dynamic> json) {
    return NextEvolution(
      num: json['num'],
      name: json['name'],
    );
  }
}
