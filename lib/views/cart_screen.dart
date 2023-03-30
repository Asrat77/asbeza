import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../bloc/home_bloc.dart';






class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Colors.white,

      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitialState) {
            return const Center(
                child: Text(
                  "ADD ITEMS TO CART TO VIEW HISTORY!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ));
          }
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeSuccessState) {
            if (state.history.isEmpty) {
              return const Center(
                  child: Text(
                    "ADD ITEMS TO CART TO VIEW HISTORY!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ));
            } else {
              // ignore: non_constant_identifier_names
              num TotalPrice = 0;
              // ignore: no_leading_underscores_for_local_identifiers
              void _incrementCounter() {
                for (var i in state.history) {
                  TotalPrice += i.price;
                }
              }

              _incrementCounter();
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "TOTAL: ${TotalPrice.toStringAsFixed(2)}\$",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    //margin: const EdgeInsets.only(top: 5),
                    height: MediaQuery.of(context).size.height * .84,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.black,
                      ),
                      itemCount: state.history.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final item = state.history[index];
                        return Column(

                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: NetworkImage(
                                                  item.image))),
                                      height: MediaQuery.of(context).size.height / 10,
                                      width: MediaQuery.of(context).size.width / 6,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 11, vertical: 20),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .4,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(item.title),
                                          Text(
                                            "${item.price}\$",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),],),),],),],),
                            const SizedBox(
                              height: 1,
                            )],);},
                    ),),
                ],);
            }}
                    return Container();},),
      bottomNavigationBar: GNav(
      tabs: [
        GButton(icon: Icons.shopping_cart,text: "History",onPressed: (){Navigator.pushNamed(context, "/cart");},),
        GButton(icon: Icons.home, text: "Home",onPressed: (){Navigator.pushNamed(context, "/");},),
      GButton(icon: Icons.account_circle,text: "Profile",onPressed: (){Navigator.pushNamed(context, "/profile");},),
    const GButton(icon: Icons.settings,)],
      )
    );}
}