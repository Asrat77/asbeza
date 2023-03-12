import 'package:asbeza/bloc/home_state.dart';
import 'package:asbeza/views/components/navBar.dart';
import 'package:asbeza/views/itemsCard.dart';
import 'package:asbeza/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asbeza/models/asbeza.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import 'package:asbeza/data_provider/apiService.dart';

ApiService service = ApiService();


class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);
  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  int iterator=0;
  @override


  Widget build(BuildContext context) {
    return Scaffold(


        bottomNavigationBar: GNav(


    tabs: [
    GButton(icon: Icons.home, text: "Home",onPressed: (){Navigator.pushNamed(context, "/");},),
    GButton(icon: Icons.shopping_cart,text: "History",onPressed: (){Navigator.pushNamed(context, "/cart");},),
    GButton(icon: Icons.account_circle,text: "Profile",onPressed: (){Navigator.pushNamed(context, "/profile");},),
    GButton(icon: Icons.settings,text: "Profile",)

    ],

    ),
        body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitialState) {
                return Center(
                  child: Container(
                    color: Colors.blueGrey,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          alignment: Alignment.center,
                          elevation: 0),
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context).add(
                             GetDataButtonPressed()  );
                      },
                      icon: const Icon(Icons.shopping_basket_rounded),
                      label: const Text("Get Started"),
                    ),
                  ),
                );
              }
              if (state is HomeLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if (state is HomeSuccessState) {
                return Center(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: state.asbeza.length,
                      separatorBuilder: (context, index) => const Divider(
                      color: Colors.black,
                    ),
                      itemBuilder: (context, iterator){
                        final Asbeza item = state.asbeza![iterator];
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: NetworkImage(item.image))),

                                      height: MediaQuery.of(context).size.height / 10,
                                      width: MediaQuery.of(context).size.width / 3,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 7),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width / 4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(item.title),
                                            Text(
                                              "${item.price} Birr",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(HistoryEvent(asbeza: item));
                                    },
                                    icon: const Icon(Icons.add_circle))
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        );
                      },
                  ),
                );
              }
              return Container();
            },
        ),
    );
  }
}