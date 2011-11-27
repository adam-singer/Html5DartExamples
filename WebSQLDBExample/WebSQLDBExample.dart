#import('dart:html');
//#import('dart:dom');
#import('dart:dom', prefix:'dom');
class WebSQLDBExample {
// NOTE: WebSQL is not fully implemented in dart
  WebSQLDBExample() {
    
    // Wire button handlers
    document.query('new-record-button');
    document.query('new-table-button');
    document.query('drop-table-button');
    var log = document.query('db-log');
    var results = document.query('db-results');
    dom.Database db = new dom.Database();
    
    
  }

  void run() {
    //write("Hello World!");
  }

  /*
  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
  */
}

void main() {
  new WebSQLDBExample().run();
}
