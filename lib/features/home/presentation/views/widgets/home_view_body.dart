import 'package:bookly_app_advanced_course/core/styles.dart';
import 'package:bookly_app_advanced_course/features/home/presentation/manegar/featuredt_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_advanced_course/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app_advanced_course/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(height: 20),
                CustomListViewWithCubit(),
                SizedBox(height: 40),
                Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: BestSellerListView(),
          ),
        ],
      ),
    );
  }
}

class CustomListViewWithCubit extends StatelessWidget {
  const CustomListViewWithCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksLoading) {
          return const CircularProgressIndicator();
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else if (state is FeaturedBooksSuccess) {
          return CustomListView(
            booksList: state.booksList,
          );
        } else {
          return const Text("Some Thing Went Wrong ");
        }
      },
    );
  }
}
