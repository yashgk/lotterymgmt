class Entry {
  int id;
  String date;
  int rackNo;
  Userid user;
  int price;
  int unit;
  int total;
  String updateOn;

  Entry({
    required this.id,
    required this.date,
    required this.user,
    required this.rackNo,
    required this.price,
    required this.unit,
    required this.total,
    required this.updateOn,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        id: json["id"],
        date: json["date"],
        user: Userid.fromJson(json["user"]),
        rackNo: json["rack_no"],
        price: json["price"],
        unit: json["unit"],
        total: json["total"],
        updateOn: json["update_on"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["date"] = date;
    data["user"] = user.toJson();
    data["rack_no"] = rackNo;
    data["price"] = price;
    data["unit"] = unit;
    data["total"] = total;
    data["update_on"] = updateOn;
    return data;
  }
}

class Userid {
  int id;

  Userid({
    required this.id,
  });

  factory Userid.fromJson(Map<String, dynamic> json) => Userid(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
