import 'package:acm_test/core/repository/models/all_product_response.dart';
import 'package:acm_test/core/string_extension.dart';
import 'package:acm_test/features/products/cubits/get_all_categories/get_all_categories_cubit.dart';
import 'package:acm_test/features/products/cubits/get_all_products/get_all_products_cubit.dart';
import 'package:acm_test/ui/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AllProducts extends StatefulWidget {
  static const String id = 'allProducts';
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetAllCategoriesCubit>().getAllCategories();
    });

    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Products',
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              splashColor: AppColors.primaryColor.withOpacity(0.2),
              highlightColor: AppColors.primaryColor.withOpacity(0.2),
              onTap: () => Navigator.pushNamed(context, SummaryScreen.id),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.how_to_vote,
                      size: 15,
                      color: AppColors.secondaryColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Summary',
                      textScaler: const TextScaler.linear(1),
                      style: textTheme.bodySmall!.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(color: AppColors.blackColor2),
          const SizedBox(height: 15),
          Expanded(
            child: BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const CustomSpinner(),
                  orElse: () => const SizedBox(),
                  error: (error) => ErrorWidget(
                    error: error.toString(),
                    onPressed: () => context
                        .read<GetAllCategoriesCubit>()
                        .getAllCategories(),
                  ),
                  gottenAllCategories: (gottenAllCategories) {
                    final tabWidget = <Widget>[];
                    final tabViewWidget = <Widget>[];
                    if (gottenAllCategories.data.isNotEmpty) {
                      tabWidget.add(
                        const Tab(
                          child: Text(
                            'All',
                            textScaler: TextScaler.linear(1),
                          ),
                        ),
                      );
                      tabViewWidget.add(const ProductItems());
                    }
                    for (final category in gottenAllCategories.data) {
                      tabWidget.add(
                        Tab(
                          child: Text(
                            category.titleCase(),
                            textScaler: const TextScaler.linear(1),
                          ),
                        ),
                      );
                      tabViewWidget.add(ProductItems(category: category));
                    }

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: CustomTextFormField(
                            hintText: 'Search...',
                            textEditingController: searchController,
                            keyboardType: TextInputType.text,
                            prefix: const Icon(
                              Iconsax.search_normal_14,
                              color: AppColors.greyColor3,
                              size: 17,
                            ),
                            textInputAction: TextInputAction.search,
                            bottomSpacing: false,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Transform.translate(
                                    offset: const Offset(0, 1.3),
                                    child: const Divider(
                                      color: AppColors.strokeColor,
                                      height: 5,
                                      thickness: 0.8,
                                    ),
                                  ),
                                  TabBar(
                                    controller: _tabController,
                                    isScrollable: false,
                                    indicatorColor: AppColors.primaryColor,
                                    labelStyle: textTheme.bodyMedium!.copyWith(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    unselectedLabelStyle:
                                        textTheme.bodyMedium!.copyWith(
                                      color: AppColors.greyColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    tabs: tabWidget,
                                  ),
                                  const SizedBox(height: 4),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: tabViewWidget,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.error,
    required this.onPressed,
  });

  final String error;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 100.h),
        Text(
          error,
          textScaler: const TextScaler.linear(1),
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Button(
          label: 'Retry',
          color: Colors.red.withOpacity(0.7),
          onPressed: onPressed,
        )
      ],
    );
  }
}

class ProductItems extends StatefulWidget {
  const ProductItems({
    super.key,
    this.category,
  });

  final String? category;

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<GetAllProductsCubit>()
          .getAllProduct(category: widget.category);
    });
  }

  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const AllProductsShimmerList(),
          orElse: () => const SizedBox(),
          error: (error) => ErrorWidget(
            error: error.toString(),
            onPressed: () => context
                .read<GetAllProductsCubit>()
                .getAllProduct(category: widget.category),
          ),
          gottenAllProducts: (gottenAllProducts) {
            return Padding(
              padding: const EdgeInsets.only(right: 4),
              child: RawScrollbar(
                controller: scrollController,
                thumbVisibility: true,
                thumbColor: AppColors.primaryColor.withOpacity(0.4),
                radius: const Radius.circular(5.0),
                thickness: 2,
                child: GridView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(24, 20, 20, 40),
                  itemCount: gottenAllProducts.data.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final product = gottenAllProducts.data[index];
                    return ProductWidget(product: product);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    this.product,
  });

  final ProductDetails? product;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicWidth(
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: mqr.height * 0.18,
            color: AppColors.greyColor,
            child: CachedNetworkImage(
              imageUrl: product?.image ?? '',
              filterQuality: FilterQuality.none,
              errorWidget: (context, url, error) => Container(
                color: AppColors.greyColor.withOpacity(0.2),
              ),
              placeholder: (context, url) => Container(
                color: AppColors.greyColor.withOpacity(0.4),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          product?.name ?? '',
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '\$${product?.price ?? ''} ',
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.goldColor,
          ),
        ),
      ],
    );
  }
}
