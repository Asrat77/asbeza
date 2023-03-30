class Asbeza {
  int id;
  String title;
  num price;
  String description;

  String image;

  Asbeza({required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });


  factory Asbeza.fromJson(Map<String, dynamic> json) {
    return Asbeza(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    return data;
  }

  static List? asbezaList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(Asbeza.fromJson(asbeza[i]));
    }
    return asbezas;
  }

  factory Asbeza.historyFromJson(Map<String, dynamic> json) {
    return Asbeza(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        image: json['image']);
  }

  static List historyList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(Asbeza.historyFromJson(asbeza[i]));
    }
    return asbezas;
  }

}



