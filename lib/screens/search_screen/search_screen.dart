import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/models/home_model.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/utils/size_extention.dart';
import '../../shared/components/styles/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();


  List<ProductData> planet = [];

  void search(String query) {
    searchController.text = query;
    final suggestions = AppCubit.get(context).homeModel!.data.where((planets) {
      final planetTitle = planets.name!.toLowerCase();
      final input = query.toLowerCase();

      return planetTitle.startsWith(input);
    }).toList();
    setState(() {
      planet = suggestions;
    });
  }

  Widget notFound() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Results for ',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Roboto'),
            ),
            Text(
              '"${searchController.text}"',
              style: TextStyle(
                color: defaultColor,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            Text(
              ' 0 found',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: defaultColor,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100.rh,
        ),
        Center(
          child: Image.asset(
            'assets/images/not_found.png',
            width: 250.rSp,
            height: 244.rSp,
          ),
        ),
        SizedBox(
          height: 40.rh,
        ),
        const Text(
          'Not Found',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 12.rh,
        ),
        Text(
          'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: const Color(0xff212121).withOpacity(0.61),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    search('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color(0xffF8F8F8),
                  height: 46.rh,
                  child: TextField(
                    onChanged: search,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/Union.png',
                          width: 16.6.rSp,
                          height: 14.8.rSp,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                        top: 16.rSp,
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Color(0xff979797),
                      ),
                      prefixStyle: const TextStyle(
                        color: Color(0xff979797),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(minHeight: 17, minWidth: 17),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image(
                          width: 17.rSp,
                          height: 17.rSp,
                          image: const AssetImage('assets/images/Search.png'),
                        ),
                      ),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1,
                          color: defaultColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  // this to show not found if search don't match anything in products.
                  child: (planet.isEmpty)
                      ? notFound()
                      : ListView.separated(
                          itemCount: planet.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 40.rh,
                          ),
                          itemBuilder: (context, index) {
                            final planets = planet[index];
                            return InkWell(
                              onTap: () {
                                if (kDebugMode) {
                                  print("${planet[index].name} ${planet[index].productId!}");
                                }
                                AppCubit.get(context).getOneProduct(
                                  planet[index].productId,
                                );
                              },
                              child: ListTile(
                                leading: Image.network(
                                  'https://lavie.orangedigitalcenteregypt.com${planets.imageUrl!}',
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text(planets.name!),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
