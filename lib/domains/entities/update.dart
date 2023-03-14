class Update {
  Update({
    required this.updatedAt,
  });

  DateTime updatedAt;

  factory Update.fromJson(Map<String, dynamic> json) => Update(
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "updatedAt": updatedAt.toIso8601String(),
      };
}
