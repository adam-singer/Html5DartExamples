#import('dart:dom');

class NativeDragAndDropExample {

  HTMLDivElement dragZone;
  HTMLDivElement dropZone;
  
  NativeDragAndDropExample() {
  }

  void run() {
    dragZone = document.getElementById('drag-zone');
    dropZone = document.getElementById('drop-zone');
    
    dragZone.ondragstart = onDragStart;
    dragZone.ondragend = onDragEnd;
    dropZone.ondragenter = onDragEnter;
    dropZone.ondragover = onDragOver;
    dropZone.ondragleave = onDragLeave;
    dropZone.ondrop = onDrop;
  }
  
  onDragStart(Event e) {
    print("onDragStart: e.type = " + e.type);
    print("onDragStart: e.target = " + e.target.toString());
    Element element = e.target;
    print ("onDragStart: element.nodeName = " + element.nodeName);
    print ("onDragStart: element.nodeType = " + element.nodeType);
    //
    if (element.nodeName == "IMG") {
      //e.clipboardData.effectAllowed = "all";
      HTMLImageElement img = element; 
      img.style.setProperty('border', '4px solid #cc3300');
    }
    else {
      if (element.parentNode.nodeName == 'overwrite') {
        e.clipboardData.setData("text", "<strong>Overwritten Content</strong>");
      }
      print ("onDragStart: element.nodeValue = " + element.nodeValue);
      element.parentElement.style.setProperty('border', '4px solid #cc3300');
    }
  
    e.returnValue = true;
  }
  
  onDragEnd(e) {
    print("onDragEnd: e.type = " + e.type);
    return true; 
  }
  
  onDragEnter(e) {
    print("onDragEnter: e.type = " + e.type);
    return true; 
  }
  
  onDragOver(e) {
    print("onDragOver: e.type = " + e.type);
    return false; 
  }
  
  onDragLeave(e) {
    return false;
  }
  
  onDrop(e) {
    return false;
  }
    
}

void main() {
  new NativeDragAndDropExample().run();
}
