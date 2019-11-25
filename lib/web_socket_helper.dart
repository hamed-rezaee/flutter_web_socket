import 'package:web_socket_channel/io.dart';

class WebSocketHelper {
  static final String _appId = '1089';
  static final String _baseUrl = 'wss://ws.binaryws.com/websockets/v3?app_id=$_appId';

  static IOWebSocketChannel _channel;

  static WebSocketHelper _instance;

  WebSocketHelper._() {
    _channel = IOWebSocketChannel.connect(_baseUrl);
  }

  static WebSocketHelper get getInstance => _instance = _instance ?? WebSocketHelper._();

  Function(String) get sendWebSocketRequest => _channel.sink.add;
  Stream<dynamic> get webSocketResponse => _channel.stream;

  dispose() {
    _channel.sink.close();
  }
}
