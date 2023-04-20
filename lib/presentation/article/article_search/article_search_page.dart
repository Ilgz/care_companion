import 'package:cash_manager/application/article/article_searcher/article_searcher_cubit.dart';
import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/presentation/article/widgets/article_card.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArticleSearchPage extends StatelessWidget {
  const ArticleSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    context.read<ArticleSearcherCubit>().state.maybeMap(
        loaded: (state) => controller.text = state.searchTerm, orElse: () {});
    return CustomScaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: BlocListener<ArticleWatcherCubit, ArticleWatcherState>(
                  listener: (context, state) {
                    state.maybeMap(
                      loadSuccess: (loadSuccessState) {
                        final searchTerm = context
                            .read<ArticleSearcherCubit>()
                            .state
                            .maybeWhen(
                              loaded: (searchResults, term) => term,
                              orElse: () => '',
                            );
                        if (searchTerm.isNotEmpty) {
                          final newArticles = loadSuccessState.articles;
                          context
                              .read<ArticleSearcherCubit>()
                              .searchArticles(searchTerm, newArticles);
                        }
                      },
                      orElse: () {},
                    );
                  },
                  child: TextField(
                    cursorColor: const Color(0xfffd894f),
                    controller: controller,
                    onSubmitted: (text) {
                      List<Article> articles =
                          context.read<ArticleWatcherCubit>().state.maybeMap(
                              loadSuccess: (state) {
                                return state.articles;
                              },
                              orElse: () => []);
                      context
                          .read<ArticleSearcherCubit>()
                          .searchArticles(text, articles);
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: const Color(0xfff2f2f7),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      hintText: 'Search...',
                      prefixIconConstraints: const BoxConstraints(
                          minWidth: 30,
                          minHeight: 30,
                          maxHeight: 31,
                          maxWidth: 31),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Color(0xfffd894f)),
                  ))
            ],
          ),
          const Divider(),
          BlocBuilder<ArticleSearcherCubit, ArticleSearcherState>(
            buildWhen: (p, c) {
              return c.maybeMap(
                  loaded: (_) => true,
                  searchHistoryLoaded: (_) => true,
                  orElse: () => false);
            },
            builder: (context, state) {
              return state.maybeMap(
                  loaded: (state) {
                    if (state.articles.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "No results found",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "We couldn't find any articles.",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.articles.length,
                          itemBuilder: (context, index) {
                            final article = state.articles[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: ArticleCard(
                                article: article,
                              ),
                            );
                          });
                    }
                  },
                  searchHistoryLoaded: (state) {
                    final List<String> searchHistoryList = state.searchHistory;

                    return searchHistoryList.isEmpty
                        ? const SizedBox()
                        : Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Search history",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          alignment: Alignment.centerRight),
                                      onPressed: () {
                                        context
                                            .read<ArticleSearcherCubit>()
                                            .clearSearchHistory();
                                      },
                                      child: const Text(
                                        "Clear",
                                        style:
                                            TextStyle(color: Color(0xfffd894f)),
                                      ))
                                ],
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: searchHistoryList.length,
                                  itemBuilder: (context, index) {
                                    //return Container(margin:EdgeInsets.only(bottom: 8),width: double.infinity,height: 10,color: Colors.red,);
                                    return TextButton(

                                        style: TextButton.styleFrom(

                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          padding: EdgeInsets.all(0),
                                            alignment: Alignment.centerLeft),
                                        onPressed: () {
                                          controller.text =
                                              searchHistoryList[index];
                                          List<Article> articles = context
                                              .read<ArticleWatcherCubit>()
                                              .state
                                              .maybeMap(
                                                  loadSuccess: (state) {
                                                    return state.articles;
                                                  },
                                                  orElse: () => []);
                                          context
                                              .read<ArticleSearcherCubit>()
                                              .searchArticles(
                                                  controller.text, articles);
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Text(
                                          searchHistoryList[index],
                                          style: const TextStyle(color: Colors.black),
                                        ));
                                  }),
                            ],
                          );
                  },
                  orElse: () => const SizedBox());
            },
          )
        ],
      ),
    );
  }
}
