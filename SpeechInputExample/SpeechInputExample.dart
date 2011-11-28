#import('dart:dom');

class SpeechInputExample {
  
  SpeechInputExample() {
  }

  HTMLInputElement speechInput;
  void run() {
    speechInput = document.getElementById('speech-input-field');
    speechInput.onwebkitspeechchange = onChange;
  }
  void onChange(Event e) {
    print("e.type" + e.type);
    HTMLParagraphElement p = document.getElementById('speech-message');
    p.innerHTML = 'speechInput.value has changed to <b>' + speechInput.value + '</b>';
  }
  
}

void main() {
  new SpeechInputExample().run();
}
