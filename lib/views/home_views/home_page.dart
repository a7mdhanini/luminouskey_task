import 'package:flutter/material.dart';
import 'package:luminouskey_task/controllers/home_provider.dart';
import 'package:luminouskey_task/views/home_views/widgets/home_app_bar.dart';
import 'package:luminouskey_task/views/home_views/widgets/main_page_data.dart';
import 'package:luminouskey_task/views/home_views/widgets/user_image.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<HomePageProvider>(context, listen: false)
            .fetchDoctorsData(context),
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Consumer<HomePageProvider>(
              builder: (context, provider, child) {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ///----Appbar
                        const HomeAppBar(),

                        ///----Main Page Data----///
                        MainPageData(provider: provider),
                      ],
                    ),

                    ///----User Image----///
                    const UserImage(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
