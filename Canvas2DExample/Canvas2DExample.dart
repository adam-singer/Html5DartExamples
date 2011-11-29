#import('dart:html');
// http://slides.html5rocks.com/#canvas-2d
class Canvas2DExample {

  Canvas2DExample() {
  }

  void run() {
    final context = document.query('#canvas-area').getContext('2d'); 
    context.fillRect(250, 25, 150, 100); 
    context.beginPath(); 
    context.arc(450, 110, 100, Math.PI * 1/2, Math.PI * 3/2, false); 
    context.lineWidth = 15; 
    context.lineCap = 'round'; 
    context.setStrokeColor('rgba(255, 127, 0, 0.5)'); 
    context.stroke(); 
  }
}

void main() {
  new Canvas2DExample().run();
}
