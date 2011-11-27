#import('dart:dom');
// http://slides.html5rocks.com/#canvas-2d
class Canvas2DExample {

  Canvas2DExample() {
  }

  void run() {
    HTMLCanvasElement canvasElement = document.getElementById('canvas-area');
    CanvasRenderingContext2D canvasRenderingContext2D = canvasElement.getContext('2d');
    
    canvasRenderingContext2D.fillRect(250, 25, 150, 100);
    canvasRenderingContext2D.beginPath();
    canvasRenderingContext2D.arc(450, 110, 100, Math.PI * 1/2, Math.PI * 3/2, false);
    canvasRenderingContext2D.lineWidth = 15;
    canvasRenderingContext2D.lineCap = 'round';
    canvasRenderingContext2D.setStrokeColor('rgba(255, 127, 0, 0.5)');
    canvasRenderingContext2D.stroke();
    
  }
}

void main() {
  new Canvas2DExample().run();
}
