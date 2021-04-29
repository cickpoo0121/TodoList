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
}
