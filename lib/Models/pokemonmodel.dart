// ignore_for_file: unused_label, non_constant_identifier_names

class Pokemon {
  static List l = [];
  num? id;
  String? nume;
  String? name;
  String? img;
  List? type;
  String? height;
  String? weight;
  String? candy;
  num? candy_count;
  String? egg;
  num? spawn_chance;
  num? avg_spawns;
  String? spawn_time;
  List? multipliers;
  List? weaknesses;
  List? next_evolution;

  Pokemon({
    this.id,
    this.nume,
    this.img,
    this.type,
    this.avg_spawns,
    this.candy,
    this.candy_count,
    this.egg,
    this.height,
    this.multipliers,
    this.name,
    this.next_evolution,
    this.spawn_chance,
    this.spawn_time,
    this.weaknesses,
    this.weight,
  });

  Pokemon.fromMap(Map p) {
    // print(p["id"]);

    id = p["id"];
    nume = p["num"];
    img = p["img"].replaceAll("http", "https");
    type = p["type"];
    avg_spawns = p["avg_spawns"];
    candy = p["candy"];
    candy_count = p["candy_count"];
    egg = p["egg"];
    height = p["height"];
    multipliers = p["multipliers"];
    name = p["name"];
    next_evolution = p["next_evolution"];
    spawn_chance = p["spawn_chance"];
    spawn_time = p["spawn_time"];
    weaknesses = p["weaknesses"];
    weight = p["weight"];
  }

  toMap() {
    // print(name);

    l.add(Pokemon(
        id: id,
        nume: nume,
        img: img,
        type: type,
        avg_spawns: avg_spawns,
        candy: candy,
        candy_count: candy_count,
        egg: egg,
        height: height,
        multipliers: multipliers,
        name: name,
        next_evolution: next_evolution,
        spawn_chance: spawn_chance,
        spawn_time: spawn_time,
        weaknesses: weaknesses,
        weight: weight));
  }
}
