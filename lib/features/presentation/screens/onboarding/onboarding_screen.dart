import 'package:flutter/material.dart';
import 'package:isar_app/features/presentation/screens/actividades_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<_OnboardingPageData> pages = [
      _OnboardingPageData(
        image: 'assets/images/onboarding-1.gif',
        title: 'Bienvenido a PASH',
        subtitle: 'Donde te ayudamos a tener una vida un poco más organizada',
      ),
      _OnboardingPageData(
        image: 'assets/images/onboarding-2.gif',
        title: 'Control Total',
        subtitle: 'Logra todas tus metas con una buena organización',
      ),
      _OnboardingPageData(
        image: 'assets/images/onboarding-3.gif',
        title: 'Flexibilidad',
        subtitle: 'Ve tu progreso y disfruta de una vida mas organizada',
      ),
    ];

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ActividadesScreen()),
                  ),
                  child: Text(
                    'Omitir',
                    style: TextStyle(color: Color(0xFF1e88e5), fontSize: 15),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        page.image,
                        width: 350,
                        height: 350,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        page.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Text(
                          page.subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
                      smooth_page_indicator.SmoothPageIndicator(
                        controller: _pageController,
                        count: pages.length,
                        effect: smooth_page_indicator.WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 8,
                          dotColor: Color.fromARGB(255, 113, 161, 202),
                          activeDotColor: Color(0xFF1e88e5),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFF1e88e5),
                              foregroundColor: Colors.black87,
                              side: BorderSide(color: Colors.black12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () async {
                              final nextPage =
                                  _pageController.hasClients &&
                                      _pageController.page != null
                                  ? _pageController.page!.round() + 1
                                  : 1;
                              if (nextPage < pages.length) {
                                _pageController.animateToPage(
                                  nextPage,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.ease,
                                );
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ActividadesScreen(),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              pages.length - 1 != index
                                  ? 'Siguiente'
                                  : 'Comenzar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPageData {
  final String image;
  final String title;
  final String subtitle;
  _OnboardingPageData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
