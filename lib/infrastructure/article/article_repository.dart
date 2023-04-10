import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:cash_manager/domain/article/value_objects.dart';
import 'package:cash_manager/infrastructure/article/article_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IArticleRepository)
class ArticleRepository implements IArticleRepository {
  final Box<ArticleDto> _articleBox;

  ArticleRepository(@Named("article") this._articleBox);

  @override
  Future<Either<ArticleFailure, Unit>> createFavoriteArticles(
      Article article) async {
    try {
      await _articleBox.add(ArticleDto.fromDomain(article));
      return right(unit);
    } on HiveError catch (e) {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> deleteFavoriteArticles(
      Article article) async {
    try {
      final incomeList = _articleBox.values.toList();
      final index =
          incomeList.indexWhere((e) => e == ArticleDto.fromDomain(article));
      if (index == -1) {
        return left(const ArticleFailure.unexpected());
      }
      await _articleBox.deleteAt(index);
      return right(unit);
    } on HiveError {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, List<Article>>> getArticles() async {
    final List<Article> articles = [
      Article(
          name: ArticleName("10 Tips for Maintaining Your Child's Health"),
          body: ArticleBody(
              "10 Tips for Maintaining Your Child's Health\n\nAs a parent, your child's health is your top priority. However, with so much conflicting information out there, it can be hard to know what's best for your little one. Here are 10 tips for maintaining your child's health:\n\n1. Breastfeed if possible. Breast milk provides all the necessary nutrients for your baby's development and strengthens their immune system.\n\n2. Ensure proper nutrition. As your child grows, it's important to provide a balanced diet that includes plenty of fruits, vegetables, lean proteins, and whole grains.\n\n3. Encourage physical activity. Regular exercise can help your child maintain a healthy weight, improve their mood, and develop strong bones and muscles.\n\n4. Prioritize sleep. Children need plenty of sleep to support their physical and mental development, so make sure your child gets enough rest each night.\n\n5. Promote good hygiene. Teach your child to wash their hands regularly, cover their mouth when they cough or sneeze, and avoid sharing personal items like toothbrushes.\n\n6. Keep up with vaccinations. Vaccinations are a crucial way to protect your child from dangerous diseases, so make sure your child receives all the recommended immunizations.\n\n7. Schedule regular checkups. Regular visits to the pediatrician can help catch any health problems early on and ensure your child stays on track with their physical and mental development.\n\n8. Limit screen time. Too much screen time can have negative effects on your child's health, so set limits on how much time your child spends in front of screens each day.\n\n9. Encourage socialization. Socializing with peers can help your child develop important social and emotional skills, so make sure your child has opportunities to interact with other children.\n\n10. Be a good role model. Children often model their behavior after their parents, so make sure you're setting a good example by prioritizing your own health and wellness.\n\nBy following these tips, you can help ensure that your child stays healthy and happy as they grow and develop. Remember, a healthy child is a happy child!"),
          image: "article_1",
          date: DateTime.now()),
      Article(
          name: ArticleName(
              "Understanding Anxiety in Children: Signs, Symptoms, and Treatment"),
          body: ArticleBody(
              "Anxiety is a common mental health condition that affects people of all ages, including children. It can be caused by a variety of factors, including genetics, life experiences, and environmental factors. In this article, we will explore the signs, symptoms, and treatment options for anxiety in children.\n\nSigns and Symptoms of Anxiety in Children\n\nAnxiety in children can manifest in a variety of ways. Some common signs and symptoms of anxiety in children include:\n\n- Excessive worry or fear about everyday situations\n- Physical symptoms such as headaches, stomachaches, or fatigue\n- Avoidance of certain situations or activities\n- Difficulty sleeping or frequent nightmares\n- Irritability or anger\n- Poor concentration or restlessness\n- Self-doubt or negative self-talk\n- Increased sensitivity to criticism or rejection\n\nIt's important to note that some anxiety is normal in children, especially during periods of change or stress. However, if your child's anxiety is persistent and interfering with their daily life, it may be time to seek professional help.\n\nTreatment Options for Anxiety in Children\n\nThere are a variety of treatment options available for children with anxiety. The best course of treatment will depend on the severity of your child's symptoms and their individual needs. Some common treatment options for anxiety in children include:\n\n- Cognitive-behavioral therapy (CBT): This is a type of therapy that helps children identify and change negative thought patterns and behaviors that contribute to their anxiety.\n- Exposure therapy: This type of therapy gradually exposes children to situations or activities that they fear, helping them to overcome their anxiety.\n- Medication: In some cases, medication may be prescribed to help manage symptoms of anxiety. However, medication is generally not recommended as a first-line treatment for children.\n\nIn addition to these treatment options, there are also things that you can do as a parent to help your child manage their anxiety. These include:\n\n- Creating a calm and supportive home environment\n- Encouraging healthy habits such as exercise and good sleep hygiene\n- Helping your child to develop coping strategies such as deep breathing, visualization, or mindfulness\n- Being a good listener and providing emotional support to your child\n\nConclusion\n\nAnxiety can be a challenging condition to deal with, but with the right treatment and support, children can learn to manage their symptoms and lead healthy, fulfilling lives. If you're concerned about your child's anxiety, don't hesitate to reach out to a mental health professional for help. With the right treatment and support, your child can overcome their anxiety and thrive."),
          image: "article_2",
          date: DateTime.now()),
      // Article(
      //     name: ArticleName(
      //         "Effective Strategies for Raising Happy, Healthy child"),
      //     body: ArticleBody(
      //         "Anxiety is a common mental health condition that affects people of all ages, including children. It can be caused by a variety of factors, including genetics, life experiences, and environmental factors. In this article, we will explore the signs, symptoms, and treatment options for anxiety in children.\n\nSigns and Symptoms of Anxiety in Children\n\nAnxiety in children can manifest in a variety of ways. Some common signs and symptoms of anxiety in children include:\n\n- Excessive worry or fear about everyday situations\n- Physical symptoms such as headaches, stomachaches, or fatigue\n- Avoidance of certain situations or activities\n- Difficulty sleeping or frequent nightmares\n- Irritability or anger\n- Poor concentration or restlessness\n- Self-doubt or negative self-talk\n- Increased sensitivity to criticism or rejection\n\nIt's important to note that some anxiety is normal in children, especially during periods of change or stress. However, if your child's anxiety is persistent and interfering with their daily life, it may be time to seek professional help.\n\nTreatment Options for Anxiety in Children\n\nThere are a variety of treatment options available for children with anxiety. The best course of treatment will depend on the severity of your child's symptoms and their individual needs. Some common treatment options for anxiety in children include:\n\n- Cognitive-behavioral therapy (CBT): This is a type of therapy that helps children identify and change negative thought patterns and behaviors that contribute to their anxiety.\n- Exposure therapy: This type of therapy gradually exposes children to situations or activities that they fear, helping them to overcome their anxiety.\n- Medication: In some cases, medication may be prescribed to help manage symptoms of anxiety. However, medication is generally not recommended as a first-line treatment for children.\n\nIn addition to these treatment options, there are also things that you can do as a parent to help your child manage their anxiety. These include:\n\n- Creating a calm and supportive home environment\n- Encouraging healthy habits such as exercise and good sleep hygiene\n- Helping your child to develop coping strategies such as deep breathing, visualization, or mindfulness\n- Being a good listener and providing emotional support to your child\n\nConclusion\n\nAnxiety can be a challenging condition to deal with, but with the right treatment and support, children can learn to manage their symptoms and lead healthy, fulfilling lives. If you're concerned about your child's anxiety, don't hesitate to reach out to a mental health professional for help. With the right treatment and support, your child can overcome their anxiety and thrive."),
      //     image: "image",
      //     date: DateTime.now()),
      // Article(
      //     name: ArticleName(
      //         "Positive Discipline: Effective Strategies for Raising Well-Behaved child"),
      //     body: ArticleBody(
      //         "Disciplining children is one of the most challenging aspects of parenting. It can be difficult to know how to discipline your child in a way that is effective and positive. In this article, we'll explore the concept of positive discipline and effective strategies for raising well-behaved children.\n\nWhat is Positive Discipline?\n\nPositive discipline is a parenting approach that focuses on teaching children to make good choices rather than punishing them for bad behavior. It involves setting clear expectations, offering guidance and support, and reinforcing positive behavior with praise and rewards.\n\nEffective Strategies for Positive Discipline\n\n1. Set clear expectations: Children need clear boundaries and expectations to feel secure. Make sure your child knows what is expected of them and what the consequences will be if they don't follow the rules.\n\n2. Reinforce positive behavior: Rather than focusing on punishment, try to reinforce positive behavior with praise and rewards. This can help build your child's self-esteem and encourage good behavior.\n\n3. Use natural consequences: Natural consequences are the natural result of a child's behavior. For example, if your child forgets their homework, they may receive a lower grade. Natural consequences help teach children to take responsibility for their actions.\n\n4. Use logical consequences: Logical consequences are consequences that are directly related to a child's behavior. For example, if your child breaks a toy, they may need to help pay for a replacement. Logical consequences help children learn from their mistakes and make amends for their actions.\n\n5. Offer guidance and support: Children need guidance and support to learn how to make good choices. Offer your child guidance and support as they learn to navigate the world around them.\n\nBy using positive discipline strategies, you can help your child develop the skills they need to make good choices and become well-behaved, responsible adults. Remember, positive discipline takes time and patience, but it is well worth the effort in the long run."),
      //     image: "image",
      //     date: DateTime.now()),
      // Article(
      //     name: ArticleName(
      //         "Fostering Creativity in Children: Tips and Strategies"),
      //     body: ArticleBody(
      //         "Creativity is an important skill that can help children succeed in all areas of life. By fostering creativity in your child, you can help them develop problem-solving skills, improve their self-esteem, and think outside the box. In this article, we'll explore some tips and strategies for fostering creativity in children.\n\n1. Provide opportunities for exploration and experimentation: Children learn by exploring and experimenting with the world around them. Offer your child opportunities to try new things, whether it's through art, music, or other creative activities.\n\n2. Encourage open-ended play: Open-ended play allows children to use their imaginations and think creatively. Provide your child with toys and materials that allow for open-ended play, such as blocks, art supplies, or dress-up clothes.\n\n3. Emphasize process over product: Instead of focusing on the end result, encourage your child to enjoy the process of creating. This can help them develop a love for the creative process and be more willing to take risks.\n\n4. Provide positive feedback: Positive feedback can help build your child's self-esteem and encourage them to continue being creative. Make sure to praise your child for their efforts, not just their accomplishments.\n\n5. Model creativity: Children learn by watching and imitating their parents. Make sure to model creativity in your own life, whether it's through cooking, writing, or other creative pursuits.\n\n6. Foster a love of learning: Creativity and learning go hand in hand. Encourage your child to explore their interests and learn about new topics. This can help spark their creativity and give them new ideas to explore.\n\nBy fostering creativity in your child, you can help them develop a valuable skill that will serve them well throughout their lives. Remember, creativity is not something that can be forced, but by providing the right environment and opportunities, you can help your child unleash their creative potential."),
      //     image: "image",
      //     date: DateTime.now()),
    ];
    return right(articles);
  }

  @override
  Future<Either<ArticleFailure, List<Article>>> getFavoriteArticles() async {
    final articles =
        _articleBox.values.toList().map((e) => e.toDomain()).toList();
    return right(articles);
  }
}
