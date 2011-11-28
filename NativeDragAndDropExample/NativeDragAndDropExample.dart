#import('dart:dom');
// Cannot finish this because of this bug: http://code.google.com/p/dart/issues/detail?id=538
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
  else if (element.nodeName == "SPAN"){
    //print ("onDragStart: element.nodeValue = " + element.nodeValue);
   // element.parentElement.style.setProperty('border', '4px solid #888');
    HTMLSpanElement span = element;
    span.style.setProperty('border', '4px solid #cc3300');
  } else if (element.nodeName == "#text") {
    //print ("onDragStart: element.nodeValue = " + element.nodeValue);
    print ("onDragStart: element.nodeValue = " + element.nodeValue);
    element.parentElement.style.setProperty('border', '4px solid #cc3300');
  }
   // {
   //   if (element.parentNode.nodeName == 'overwrite') {
   //     e.clipboardData.setData("text", "<strong>Overwritten Content</strong>");
   //   }
      
   // }
  //
    e.returnValue = true;
  }
  
  onDragEnd(Event e) {
    print("onDragEnd: e.type = " + e.type);
    print("onDragEnd: e.target = " + e.target.toString());
    Element element = e.target;
    print ("onDragEnd: element.nodeName = " + element.nodeName);
    print ("onDragEnd: element.nodeType = " + element.nodeType);
    
    if (element.nodeName == "IMG") {
      HTMLImageElement img = element; 
      img.style.setProperty('border', '4px solid #888');
    } else if (element.nodeName == "SPAN"){
      //print ("onDragStart: element.nodeValue = " + element.nodeValue);
     // element.parentElement.style.setProperty('border', '4px solid #888');
      HTMLSpanElement span = element;
      span.style.setProperty('border', '4px solid #888');
    } else if (element.nodeName == "#text") {
      //print ("onDragStart: element.nodeValue = " + element.nodeValue);
      element.parentElement.style.setProperty('border', '4px solid #888');
    }
    
    e.returnValue = true;
  }
  
  onDragEnter(Event e) {
    print("onDragEnter: e.type = " + e.type);
    print("onDragEnter: e.target = " + e.target.toString());
    Element element = e.target;
    print ("onDragEnter: element.nodeName = " + element.nodeName);
    print ("onDragEnter: element.nodeType = " + element.nodeType);
    
    e.preventDefault();
    //e.clipboardData.dropEffect = 'copy';
    //e.clipboardData.
    e.returnValue = true; 
  }
  
  onDragOver(Event e) {
    print("onDragOver: e.type = " + e.type);
    print("onDragOver: e.target = " + e.target.toString());
    Element element = e.target;
    print ("onDragOver: element.nodeName = " + element.nodeName);
    print ("onDragOver: element.nodeType = " + element.nodeType);
    e.preventDefault();
    e.returnValue = false; 
  }
  
  onDragLeave(Event e) {
    print("onDragLeave: e.type = " + e.type);
    print("onDragLeave: e.target = " + e.target.toString());
    Element element = e.target;
    print ("onDragLeave: element.nodeName = " + element.nodeName);
    print ("onDragLeave: element.nodeType = " + element.nodeType);
    e.preventDefault();
    e.returnValue = false;
  }
  
  onDrop(Event e) {
    print("onDrop: e.type = " + e.type);
    print("onDrop: e.target = " + e.target.toString());
    Element element = e.target;
    Element srcElement = e.srcElement;
    print ("onDrop: element.nodeName = " + element.nodeName);
    print ("onDrop: element.nodeType = " + element.nodeType);
    print ("onDrop: srcElement.nodeName = " + srcElement.nodeName);
    print ("onDrop: srcElement.nodeType = " + srcElement.nodeType);
    Element currentTarget = e.currentTarget;
    print ("onDrop: currentTarget.nodeName = " + currentTarget.nodeName);
    print ("onDrop: currentTarget.nodeType = " + currentTarget.nodeType);
    
    //print ("onDrop: currentTarget.nodeValue = " + currentTarget.nodeValue);
    //element.getAttribute()
    //print ("onDrop: element.attributes.getNamedItem(name) = " + element.getAttribute("name"));
   // print ("onDrop: srcElement.attributes.getNamedItem(name) = " + srcElement.attributes.getNamedItem("name"));
   // print ("onDrop: currentTarget.attributes.getNamedItem(name) = " + currentTarget.attributes.getNamedItem("name"));
    e.preventDefault();
    
    HTMLDivElement dropdata = document.getElementById('drop-data');
    
    dropdata.textContent = '';
    
    //DataTransferItemList dttl;
    
    //print(e.clipboardData.toString());
    
    //DataTransferItemList types = e.clipboardData.items;
    //for (int i=0; i<types.length; i++) {
    //  print("i = ${i}");
    //  print("types[i] = " + types.item(i));
    //}
      
    e.returnValue = false;
  }
    
}

void main() {
  new NativeDragAndDropExample().run();
}
