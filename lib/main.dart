import 'dart:convert';

import 'package:flutter_web_socket/web_socket_helper.dart';

main() async {
  Map<String, dynamic> _request = {'ticks': 'R_50', 'subscribe': 1};

  print('START!');
  WebSocketHelper.getInstance.sendWebSocketRequest(json.encode(_request));

  WebSocketHelper.getInstance.webSocketResponse.listen(
    (message) {
      print(json.decode(message));
    },
    onDone: () {
      print('DONE!');
    },
    onError: (erorr) {
      print(erorr);
    },
  );
}
