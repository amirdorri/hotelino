class BedType {
  final String type;
  final int count;
  final String details;

  BedType({
    required this.type,
    required this.count,
    required this.details,
  });

  factory BedType.fromJson(Map<String, dynamic> json) => BedType(
    type: json["type"],
    count: json["count"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "count": count,
    "details": details,
  };
}