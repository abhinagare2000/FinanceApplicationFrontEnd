import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {"text": "Welcome to our App", "color": Color(0xFF56A0D3)}, // Soft Coral
    {"text": "Get Started", "color": Color(0xFF9B82B0)},
    {"text": "Explore Features", "color": Color(0xFF7AA3A3)}, // Sky Blue
    {"text": "Stay Connected", "color": Color(0xFFD2851A)}, // Mellow Yellow
  ];

  void _zoomToPage(BuildContext context, int pageIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ZoomPage(
          pages: _pages,
          initialPage: pageIndex,
        ),
      ),
    ).then((updatedPageIndex) {
      if (updatedPageIndex != null) {
        setState(() {
          _currentPage = updatedPageIndex;
          _pageController
              .jumpToPage(_currentPage); // Scroll to the correct page
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return GestureDetector(
                    onTap: () => _zoomToPage(context, index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), // Set the radius here
                      child: Container(
                        color: page['color'],
                        child: Center(
                          child: Text(
                            page['text'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: 12.0,
                  width: _currentPage == index ? 24.0 : 12.0,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.black : Colors.grey,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ZoomPage extends StatefulWidget {
  final List<Map<String, dynamic>> pages;
  final int initialPage;

  const ZoomPage({
    Key? key,
    required this.pages,
    required this.initialPage,
  }) : super(key: key);

  @override
  _ZoomPageState createState() => _ZoomPageState();
}

class _ZoomPageState extends State<ZoomPage> {
  late PageController _zoomPageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    _zoomPageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _zoomPageController,
            itemCount: widget.pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final page = widget.pages[index];
              return Container(
                color: page['color'],
                child: Center(
                  child: Text(
                    page['text'],
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
          // Back button (with round frame)
          Positioned(
            bottom: 50,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context,
                    _currentPage); // Return the current page index to OnboardingScreen
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(const CircleBorder()),
              ),
            ),
          ),
          // Page indicators
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: 12.0,
                  width: _currentPage == index ? 24.0 : 12.0,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.black : Colors.grey,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
