import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/portfolio_screen.dart';
import 'screens/news_screen.dart';
import 'screens/sentiment_screen.dart';
import 'theme.dart';
import 'providers/auth_provider.dart';
import 'services/websocket_service.dart';
import 'globals.dart';

final WebSocketService webSocketService = WebSocketService();

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Always call this first
  webSocketService.connect(); // Start WebSocket connection

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PixelStock',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          print(
              "AuthProvider: isAuthenticated = ${authProvider.isAuthenticated}");
          if (authProvider.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // ✅ This reacts to login/logout changes
          if (authProvider.isAuthenticated) {
            return const MainScreen(); // Authenticated: show home
          } else {
            return const LoginScreen(); // Not logged in: show login
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    PortfolioScreen(),
    NewsScreen(),
    SentimentScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'PIXEL',
              style: GoogleFonts.pressStart2p(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'STOCK',
              style: GoogleFonts.pressStart2p(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () {
              // Toggle theme would go here
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Sentiment',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
