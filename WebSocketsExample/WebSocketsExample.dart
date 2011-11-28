//#import('dart:html');
#import('dart:dom');

class WebSocketsExample {

  HTMLInputElement wsSecureCb;
  HTMLLabelElement wsSecureCbLabel;
  HTMLInputElement wsUri;
  HTMLButtonElement wsConnectBut;
  HTMLButtonElement wsDisconnectBut;
  HTMLInputElement wsMessage;
  HTMLButtonElement wsSendBut;
  HTMLDivElement wsConsoleLog;
  HTMLButtonElement wsClearLogBut;
  bool wsUserDisconnectedFlag;
  WebSocket webSocket; 
  
  WebSocketsExample() {
  }

  void run() {
    window.onload = wsHandlePageLoad;
  }
  
  void wsHandlePageLoad(Event e) {
    wsSecureCb = document.getElementById('wsSecureCb');
    wsSecureCb.onclick = wsToggleTls;
    wsSecureCbLabel = document.getElementById('wsSecureCbLabel');
    
    wsUri = document.getElementById('wsUri');
    wsToggleTls(null);
    
    wsConnectBut = document.getElementById('wsConnectBut');
    wsConnectBut.onclick = wsDoConnect;
    
    wsDisconnectBut = document.getElementById('wsDisconnectBut');
    wsDisconnectBut.onclick = wsDoDisconnect;
    
    wsMessage = document.getElementById('wsMessage');
    
    wsSendBut = document.getElementById('wsSendBut');
    wsSendBut.onclick = wsDoSend;
    
    wsConsoleLog = document.getElementById('wsConsoleLog');
    
    wsClearLogBut = document.getElementById('wsClearLogBut');
    wsClearLogBut.onclick = wsClearLog;
    
    wsUserDisconnectedFlag = false;
    
    wsSetGuiConnected(false);
  }
  
  void wsToggleTls(Event e) {
    if (wsSecureCb.checked) {
      wsUri.value = "wss://html5rocks.websocket.org/echo";
    } else {
      wsUri.value = "ws://html5rocks.websocket.org/echo";
    }
  }
  
  void wsDoConnect(Event e) {
    wsConnectBut.disabled = true;
    // TODO: how to check if browser supports websocket from dart?
    // NOTE: WebSocket factory is not implemented. Sample can not be completed
    //webSocket =  _WebSocketWrappingImplementation.create__WebSocketWrappingImplementation();
    webSocket = new WebSocket();
    //webSocket.URL = wsUri.value;
    
    webSocket.onopen = wsOnOpen;
    webSocket.onclose = wsOnClose;
    webSocket.onmessage = wsOnMessage;
    webSocket.onerror = wsOnError;
  }
  
  void wsDoDisconnect(Event e) {
    wsUserDisconnectedFlag = true;
    webSocket.close();
  }
  
  void wsDoSend(Event e) {
    
  }
  
  void wsClearLog(Event e) {
    
  }
  
  void wsSetGuiConnected(bool isConnected) {
    wsUri.disabled = isConnected;
    wsConnectBut.disabled = isConnected;
    wsDisconnectBut.disabled = !isConnected;
    wsMessage.disabled = !isConnected;
    wsSendBut.disabled = !isConnected;
    wsSecureCb.disabled = isConnected;
    String labelColor = isConnected ? "#999999" : "black";
    wsSecureCbLabel.style.setProperty("color", labelColor); 
  }
  
  void wsOnOpen(Event e) {
    
  }
  
  void wsOnClose(Event e) {
    
  }
  
  void wsOnMessage(Event e) {
    
  }
  
  void wsOnError(Event e) {
    
  }
}

void main() {
  new WebSocketsExample().run();
}
