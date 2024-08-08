import 'package:cubitdemo/src/data/news_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatefulWidget {
  final Articles news;
  const NewsDetails({super.key, required this.news});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          _isLoading.value = true;
        },
        onPageFinished: (url) {
          _isLoading.value = false;
        },
      ))
      ..loadRequest(Uri.parse(widget.news.url));
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 100.0,
              width: double.infinity,
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                  child: Text(
                widget.news.title,
                style: textTheme.headlineSmall!
                    .copyWith(color: Colors.white, fontSize: 14.0),
              )),
            ),
            ValueListenableBuilder(
              valueListenable: _isLoading,
              builder: (context, loading, child) {
                return loading
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: double.infinity,
                        margin:
                            const EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 0.0),
                        child: WebViewWidget(controller: webViewController));
              },
            )
          ],
        ),
      ),
    );
  }
}
