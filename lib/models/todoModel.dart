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

  // ------  For Method 4 only ------
  // flutter method to convert class to Map
  // this method will be called automatically when we use jsonEncode()
  // toJson is to convert Map or Object to JSON
  Map<String, dynamic> toJson() {
    return {'title': title, 'status': status};
  }

  // fromJson is to convert JSON to object
  // Todo fromJson(Map<String, dynamic> json) {
  //   return Todo(title: json['title'], status: json['status']);
  // }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(title: json['title'], status: json['status']);
  }
}
