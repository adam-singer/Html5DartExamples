#import('dart:html');
// http://slides.html5rocks.com/#web-storage
class LocalStorageExample {

  LocalStorageExample() {}

  void run() {
    
    var area = document.query('#ta');
    // place content from previous edit
    if (!area.value) {
      area.value = window.localStorage.getItem('value');
    }
    
    void updateLog(new_save) {
      var log = document.query('#ta-log');
      Duration delta = new Duration();
      if (!window.localStorage.getItem('value').isEmpty()) {
        String s = window.localStorage.getItem('timestamp');
        Date dateFromLocalStore = new Date.fromString(s);
        Date now = new Date.now();
        delta = now.difference(dateFromLocalStore);
        if (new_save) {
          log.innerHTML = 'Saved. Content will be available after browser refresh/reopen.'; 
          window.setTimeout(() {
            log.innerHTML = '';
          }, 3000);
        } else {
          log.innerHTML = 'last saved: ' + delta.toString() + 's ago';
        }
      }
    }
    
    updateLog(false);
    
    // your content will be saved locally
    document.query('#save-ta').on.click.add((event) {
      window.localStorage.setItem('value', area.value);
      Date d = new Date.now();
      String timestamp = d.toString();
      window.localStorage.setItem('timestamp', timestamp);
      updateLog(true);
    });
  }
}

void main() {
  new LocalStorageExample().run();
}
