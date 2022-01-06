import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:run_it/login_page/login_page_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'feed_page/feed_page_widget.dart';
import 'profile_page/profile_page_widget.dart';
import 'edit_profile_page/edit_profile_page_widget.dart';
import 'runners/runners_widget.dart';
import 'search_page/search_page_widget.dart';
import 'runner_vid/runner_vid_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<RunItFirebaseUser> userStream;
  RunItFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = runItFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RunIt',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.black,
              child: Center(
                child: Builder(
                  builder: (context) => Image.asset(
                    'assets/images/RUN_IT_UP.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : LoginPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'FeedPage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'FeedPage': FeedPageWidget(),
      'ProfilePage': ProfilePageWidget(),
      'EditProfilePage': EditProfilePageWidget(),
      'Runners': RunnersWidget(),
      'SearchPage': SearchPageWidget(),
      'RunnerVid': RunnerVidWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.run_circle_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.run_circle_outlined,
              size: 29,
            ),
            label: 'Profile',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.edit,
              size: 24,
            ),
            label: 'Edit Profile',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.running,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.chat_bubble,
              size: 24,
            ),
            label: 'Runners',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 24,
            ),
            label: 'Search',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.run_circle_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.run_circle_outlined,
              size: 29,
            ),
            label: 'Profile',
            tooltip: '',
          )
        ],
        backgroundColor: Colors.black,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xB9FFFFFF),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
