import 'package:flutter/material.dart';
import 'package:netflix/widgets/onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
         backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          PageView(
            children: [
              Onboarding(title: "title1", subtitle: "page 1 subtitle ", image: "assets/images/2.jpg"),
              Onboarding(title: "title2", subtitle: "page 2 subtitle ", image: "assets/images/1.jpg"),
              Onboarding(title: "title3", subtitle: "page 3 subtitle ", image: "assets/images/3.jpg"),
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
                      duration: Duration(milliseconds: 500),
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 10,
                      width: 10,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
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
