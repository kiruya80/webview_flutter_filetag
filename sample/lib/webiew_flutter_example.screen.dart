import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewFlutterExampleScreen extends StatelessWidget {

String url = "https://addpipe.com/html-media-capture-demo/";
  // String url = "https://developer.mozilla.org/ko/docs/Web/HTML/Element/Input/file";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('webview flutter file tag example'),
        ),
        body: Container(
          child: WebView(
            initialUrl: url,
            // initialUrl: new Uri.dataFromString(snapshot.data, mimeType: 'text/html').toString(),
            javascriptMode: JavascriptMode.unrestricted,
            useDefaultShowFileChooser: false,
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },

            // OnShowFileRequestResult
            onShowFileChooser: (bool allowMultipleFiles, acceptTypes) async {
              print('WebViewFlutterExampleScreen onShowFileChooser ===== $allowMultipleFiles   $acceptTypes');

              List<String> resultUrl = ["url1", "url2"];
              _showSnackBar(context, resultUrl.toString());
              return resultUrl;
            },
          ),
        ));
  }
}

void _showSnackBar(BuildContext context, String msg) {
  final scaffold = ScaffoldMessenger.of(context);

  scaffold.showSnackBar(
    SnackBar(
      content: Text("Choose File Tag : " + msg),
      action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
