import 'package:asbeza/views/components/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile_number/mobile_number.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String mobileNumber="";
  List<SimCard> _simCard = <SimCard>[];

  @override
  void initState() {

    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {
        const Center(
          child: Text("Allow Device permission to view profiles")
        );
      }
    });

    initMobileNumberState();
  }
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    try {
      mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }
    if (!mounted) return;

    setState(() {});
  }
  Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => Text(
        'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}'))
        .toList();
    return Column(children: widgets);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: GNav(


      tabs: [
      GButton(icon: Icons.home, text: "Home",onPressed: (){Navigator.pushNamed(context, "/");},), GButton(icon: Icons.shopping_cart,text: "History",onPressed: (){Navigator.pushNamed(context, "/cart");},),
      GButton(icon: Icons.account_circle,text: "Profile",onPressed: (){Navigator.pushNamed(context, "/profile");},),
      GButton(icon: Icons.settings,)

      ],

    ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Column(
              children:  <Widget>[
                const CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage("assets/user-profile-icon.png"),
                ),
                Container(
                  //child: Column,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}