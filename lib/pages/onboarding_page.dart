import 'package:flutter/material.dart';
import 'package:netflix/pages/loading_page.dart';
import 'package:netflix/pages/login_page.dart';
import 'package:netflix/widgets/onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
         backgroundColor: Colors.transparent,
        leading: Image.asset("assets/images/symbol.png",),
        actions: [
          TextButton(onPressed: () {
            
          }, child: Text("Privacy",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
          TextButton(onPressed: () {

          }, child: Text("Help",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
        ],
      ),
      body: Stack(
        children: [
          PageView(

            controller: _pageController,
            onPageChanged: (int index) {
             setState(() {
               _currentPage = index;
             });
            },
            children: [
              Onboarding(title: "Bienvenue sur Netflix.", subtitle: "Explorez des milliers de films, séries et documentaires, tout cela dans un seul abonnement. ", image: "assets/images/2.jpg"),
              Onboarding(title: "Créez votre compte en quelques étapes faciles ", subtitle: "Choisissez un plan qui vous convient. Vous pouvez modifier votre abonnement à tout moment", image: "assets/images/1.jpg"),
              Onboarding(title: "Vous êtes prêt !", subtitle: " Profitez de l’expérience Netflix sur votre téléphone, tablette, ordinateur ou téléviseur. ", image: "assets/images/3.jpg"),
    ]
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: _currentPage == index ? Colors.red : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 10,
                      width: _currentPage == index ? 15 : 10,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                    },
                    child: Text("Get started"),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.horizontal()),
                        backgroundColor: Colors.red,foregroundColor: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
