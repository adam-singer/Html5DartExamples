#import('dart:dom');

class AudioVideoExample {

  AudioVideoExample() {
  }

  void run() {
    HTMLVideoElement videoClip = document.getElementById('clip');
    HTMLInputElement playButton = document.getElementById('play-button');
    HTMLInputElement pauseButton = document.getElementById('pause-button');
    HTMLInputElement muteButton = document.getElementById('mute');
    HTMLAudioElement audioClip = document.getElementById('audio-clip');
    HTMLInputElement audioPlayButton = document.getElementById('audio-play-button');
    HTMLInputElement audioPauseButton = document.getElementById('audio-pause-button');
    HTMLInputElement audioMuteButton = document.getElementById('audio-mute');  
    HTMLInputElement reflectionButton = document.getElementById('reflection-button');
    
    playButton.onclick = (Event e) {
      videoClip.play();
      playButton.disabled = true;
      pauseButton.disabled = false; 
    };
    
    pauseButton.onclick = (Event e) {
      videoClip.pause();
      playButton.disabled = false;
      pauseButton.disabled = true; 
    };
    
    muteButton.onclick = (Event e) {
      muteButton.value = videoClip.muted ? 'Mute' : 'Unmute';
      videoClip.muted = !videoClip.muted;
    };
    
    reflectionButton.onclick = (Event e) {
      String s = "below 0px -webkit-gradient(linear, 0% 0%, 0% 100%, from(transparent), color-stop(0.55, transparent), to(white))";
      if (videoClip.style.getPropertyValue('-webkit-box-reflect') == null) {
        videoClip.style.setProperty('-webkit-box-reflect', s);
      } else {
        videoClip.style.setProperty('-webkit-box-reflect', '');
      }
    };
    
    videoClip.addEventListener('ended', (Event e) {
      playButton.disabled = false;
      pauseButton.disabled = true; 
    });
    
    audioPlayButton.onclick = (Event e) {
      audioClip.play();
      audioPlayButton.disabled = true;
      audioPauseButton.disabled = false; 
    };
    
    audioPauseButton.onclick = (Event e) {
      audioClip.pause();
      audioPlayButton.disabled = false;
      audioPauseButton.disabled = true;
    };
    
    audioMuteButton.onclick = (Event e) {
      audioMuteButton.value = audioClip.muted ? 'Mute' : 'Unmute';
      audioClip.muted = !audioClip.muted;
    };
    
    audioClip.addEventListener('ended', (Event e) {
      audioPlayButton.disabled = false;
      audioPauseButton.disabled = true;
    });
  } 
}

void main() {
  new AudioVideoExample().run();
}
