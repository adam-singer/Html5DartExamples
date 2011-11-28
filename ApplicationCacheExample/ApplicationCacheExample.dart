#import('dart:html');

class ApplicationCacheExample {

  ApplicationCacheExample() {
  }

  void run() {
    
    
     window.applicationCache.on.updateReady.add((e) {
       if (window.applicationCache.status == DOMApplicationCache.UPDATEREADY) { 
         window.applicationCache.swapCache();
         if (window.confirm('A new version of this site is available. Load it?')) {
           window.location.reload();
         }
       }
     }, false);
     
     window.applicationCache.update();
  }
}

void main() {
  new ApplicationCacheExample().run();
}
