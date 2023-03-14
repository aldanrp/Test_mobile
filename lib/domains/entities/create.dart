class Create {
  Create({
    required this.createdAt,
  });

  DateTime createdAt;

  factory Create.fromJson(Map<String, dynamic> json) => Create(
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
      };
}
