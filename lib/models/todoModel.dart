import 'dart:convert';

class Todo {
  String title;
  bool status;

  // construtor
  // Todo(String title, bool status) {
  //   this.title = title;
  //   this.status = status;
  // }

  // Todo(this.title, this.status);
  // Todo('hello',true);

  Todo({this.title, this.status = false});
  // Todod(title:'hello',status:true)

  // convert class objec to json
  // String toJSON() {
  //   return jsonEncode({'title': title, 'status': status});
  // }

  // flutter method to convert class to Map
  // this method will be called automatically when we use jsonEncode()
  Map<String, dynamic> toJson() {
    return {'title': title, 'status': status};
  }
}
