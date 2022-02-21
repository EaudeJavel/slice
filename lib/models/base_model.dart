// T cast<T>(dynamic x) => x is T ? x : null;

abstract class BaseModel {
  BaseModel({dynamic json}) {
    id = json != null ? json['id'] : null;
  }

  late String id;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id
    };
  }
}