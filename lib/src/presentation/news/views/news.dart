import 'package:cubitdemo/main.dart';
import 'package:cubitdemo/src/config/route/app_routes.dart';
import 'package:cubitdemo/src/presentation/news/cubit/news_cubit.dart';
import 'package:cubitdemo/src/presentation/news/cubit/news_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<NewsCubit>().fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (context, ThemeMode currentMode, child) {
          return FloatingActionButton(
            onPressed: () {
              // Change the theme mode on button tap
              MyApp.themeNotifier.value =
                  MyApp.themeNotifier.value == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
            },
            child: Icon(
              currentMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          );
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
            Text("News", style: textTheme.titleLarge!.copyWith(fontSize: 22.0)),
      ),
      body: BlocBuilder<NewsCubit, NewsAPIState>(
        builder: (context, state) {
          if (state is NewsAPILoading || state is NewsAPIInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsAPIFailed) {
            return Center(child: Text(state.errorMessage));
          } else if (state is NewsAPILoaded) {
            return ListView.builder(
              itemCount: state.news.articles.length,
              itemBuilder: (context, newsIndex) {
                final news = state.news.articles[newsIndex];
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.newsDetails,
                        arguments: {
                          "news": news,
                        });
                  },
                  leading: CircleAvatar(
                    child: Center(
                      child: Text("${newsIndex + 1}"),
                    ),
                  ),
                  title: Text(
                    removeTextAfterHyphen(news.title),
                    style: textTheme.titleMedium,
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        news.author,
                        style:
                            textTheme.titleSmall!.copyWith(color: Colors.brown),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.22,
                        child: Text(
                          formatTimestamp(news.publishedAt),
                          style: textTheme.titleSmall!
                              .copyWith(color: Colors.brown),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  String removeTextAfterHyphen(String text) {
    final parts = text.split(' - ');
    return parts.isNotEmpty ? parts[0] : text;
  }

  String formatTimestamp(String timestamp) {
    // Parse the ISO 8601 timestamp
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the date manually
    // Example: "August 7, 2024 at 5:47 AM"
    String formattedDate =
        '${dateTime.month}/${dateTime.day}/${dateTime.year} ${_formatTime(dateTime)}';

    return formattedDate;
  }

  String _formatTime(DateTime dateTime) {
    // Format time as HH:mm AM/PM
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    String amPm = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour; // Handle midnight and noon

    return '$hour:${minute.toString().padLeft(2, '0')} $amPm';
  }
}
