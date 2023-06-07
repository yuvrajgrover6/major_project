import 'dart:convert';

class Font {
  String id;
  String name;
  String path;
  String type;
  double size;
  Font({
    required this.id,
    required this.name,
    required this.path,
    required this.type,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'path': path,
      'type': type,
      'size': size,
    };
  }

  factory Font.fromMap(Map<String, dynamic> map) {
    return Font(
      id: map['id'] as String,
      name: map['name'] as String,
      path: map['path'] as String,
      type: map['type'] as String,
      size: map['size'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Font.fromJson(String source) =>
      Font.fromMap(json.decode(source) as Map<String, dynamic>);
}
