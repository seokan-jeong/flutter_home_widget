import 'package:flutter/material.dart';
import 'package:flutter_home_widget/article_screen.dart';
import 'package:flutter_home_widget/news_data.dart';
import 'package:home_widget/home_widget.dart'; // Add this import

const String appGroupId = 'group.com.glucofit.flutterhomewidget';
const String iOSWidgetName = 'HomeWidgets';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void updateHeadline(NewsArticle newHeadline) {
  // Save the headline data to the widget
  HomeWidget.saveWidgetData<String>('headline_title', newHeadline.title);
  HomeWidget.saveWidgetData<String>(
      'headline_description', newHeadline.description);
  HomeWidget.updateWidget(
    iOSName: iOSWidgetName,
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override // Add from here
  void initState() {
    super.initState();

    HomeWidget.setAppGroupId(appGroupId);

    // Mock read in some data and update the headline
    final newHeadline = getNewsStories()[0];
    updateHeadline(newHeadline);
  } // To here.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Top Stories'),
            centerTitle: false,
            titleTextStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        body: ListView.separated(
          separatorBuilder: (context, idx) {
            return const Divider();
          },
          itemCount: getNewsStories().length,
          itemBuilder: (context, idx) {
            final article = getNewsStories()[idx];
            return ListTile(
              key: Key('$idx ${article.hashCode}'),
              title: Text(article.title),
              subtitle: Text(article.description),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ArticleScreen(article: article);
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}
