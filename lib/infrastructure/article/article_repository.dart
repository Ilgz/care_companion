import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:cash_manager/domain/article/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IArticleRepository)
class ArticleRepository implements IArticleRepository {
  final Box<String> _favArticleBox;
  final Box<String> _searchHistoryBox;

  ArticleRepository(@Named("favArticleUidBox") this._favArticleBox,
      @Named("searchHistoryBox") this._searchHistoryBox);

  @override
  Future<Either<ArticleFailure, Unit>> createFavoriteArticles(
      Article article) async {
    try {
      final favoritesEither = await getFavoriteArticles();
      return favoritesEither.fold((failure) {
        return left(failure);
      }, (favorites) async {
        if (!favorites.contains(article.uid)) {
          await _favArticleBox.add(article.uid);
        }
        return right(unit);
      });
    } on HiveError catch (e) {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> deleteFavoriteArticles(
      Article article) async {
    try {
      final favoritesEither = await getFavoriteArticles();
      return favoritesEither.fold((failure) {
        return left(failure);
      }, (favorites) async {
        int index = favorites.indexWhere((e) => e == article.uid);
        if (index == -1) {
          return left(const ArticleFailure.unexpected());
        }
        await _favArticleBox.deleteAt(index);
        return right(unit);
      });
    } on HiveError catch (e) {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, List<Article>>> getArticles() async {
    final List<Article> articles = [
      Article(
        uid: "uid_1",
        name: ArticleName("10 Tips for Maintaining Your Child's Health"),
        body: ArticleBody(
            "As a parent, your child's health is your top priority. However, with so much conflicting information out there, it can be hard to know what's best for your little one. Here are 10 tips for maintaining your child's health:\n\n1. Breastfeed if possible. Breast milk provides all the necessary nutrients for your baby's development and strengthens their immune system.\n\n2. Ensure proper nutrition. As your child grows, it's important to provide a balanced diet that includes plenty of fruits, vegetables, lean proteins, and whole grains.\n\n3. Encourage physical activity. Regular exercise can help your child maintain a healthy weight, improve their mood, and develop strong bones and muscles.\n\n4. Prioritize sleep. Children need plenty of sleep to support their physical and mental development, so make sure your child gets enough rest each night.\n\n5. Promote good hygiene. Teach your child to wash their hands regularly, cover their mouth when they cough or sneeze, and avoid sharing personal items like toothbrushes.\n\n6. Keep up with vaccinations. Vaccinations are a crucial way to protect your child from dangerous diseases, so make sure your child receives all the recommended immunizations.\n\n7. Schedule regular checkups. Regular visits to the pediatrician can help catch any health problems early on and ensure your child stays on track with their physical and mental development.\n\n8. Limit screen time. Too much screen time can have negative effects on your child's health, so set limits on how much time your child spends in front of screens each day.\n\n9. Encourage socialization. Socializing with peers can help your child develop important social and emotional skills, so make sure your child has opportunities to interact with other children.\n\n10. Be a good role model. Children often model their behavior after their parents, so make sure you're setting a good example by prioritizing your own health and wellness.\n\nBy following these tips, you can help ensure that your child stays healthy and happy as they grow and develop. Remember, a healthy child is a happy child!"),
        image: "article_1",
        date: DateTime(
          2023,
          2,
          3,
        ),
      ),
      Article(
          uid: "uid_2",
          name: ArticleName(
              "Understanding Anxiety in Children: Signs, Symptoms, and Treatment"),
          body: ArticleBody(
              "Anxiety is a common mental health condition that affects people of all ages, including children. It can be caused by a variety of factors, including genetics, life experiences, and environmental factors. In this article, we will explore the signs, symptoms, and treatment options for anxiety in children.\n\nSigns and Symptoms of Anxiety in Children\n\nAnxiety in children can manifest in a variety of ways. Some common signs and symptoms of anxiety in children include:\n\n- Excessive worry or fear about everyday situations\n- Physical symptoms such as headaches, stomachaches, or fatigue\n- Avoidance of certain situations or activities\n- Difficulty sleeping or frequent nightmares\n- Irritability or anger\n- Poor concentration or restlessness\n- Self-doubt or negative self-talk\n- Increased sensitivity to criticism or rejection\n\nIt's important to note that some anxiety is normal in children, especially during periods of change or stress. However, if your child's anxiety is persistent and interfering with their daily life, it may be time to seek professional help.\n\nTreatment Options for Anxiety in Children\n\nThere are a variety of treatment options available for children with anxiety. The best course of treatment will depend on the severity of your child's symptoms and their individual needs. Some common treatment options for anxiety in children include:\n\n- Cognitive-behavioral therapy (CBT): This is a type of therapy that helps children identify and change negative thought patterns and behaviors that contribute to their anxiety.\n- Exposure therapy: This type of therapy gradually exposes children to situations or activities that they fear, helping them to overcome their anxiety.\n- Medication: In some cases, medication may be prescribed to help manage symptoms of anxiety. However, medication is generally not recommended as a first-line treatment for children.\n\nIn addition to these treatment options, there are also things that you can do as a parent to help your child manage their anxiety. These include:\n\n- Creating a calm and supportive home environment\n- Encouraging healthy habits such as exercise and good sleep hygiene\n- Helping your child to develop coping strategies such as deep breathing, visualization, or mindfulness\n- Being a good listener and providing emotional support to your child\n\nConclusion\n\nAnxiety can be a challenging condition to deal with, but with the right treatment and support, children can learn to manage their symptoms and lead healthy, fulfilling lives. If you're concerned about your child's anxiety, don't hesitate to reach out to a mental health professional for help. With the right treatment and support, your child can overcome their anxiety and thrive."),
          image: "article_2",
          date: DateTime(
            2023,
            2,
            3,
          )),
      Article(
          uid: "uid_3",
          name: ArticleName(
              "Effective Strategies for Raising Happy, Healthy child"),
          body: ArticleBody(
              "Anxiety is a common mental health condition that affects people of all ages, including children. It can be caused by a variety of factors, including genetics, life experiences, and environmental factors. In this article, we will explore the signs, symptoms, and treatment options for anxiety in children.\n\nSigns and Symptoms of Anxiety in Children\n\nAnxiety in children can manifest in a variety of ways. Some common signs and symptoms of anxiety in children include:\n\n- Excessive worry or fear about everyday situations\n- Physical symptoms such as headaches, stomachaches, or fatigue\n- Avoidance of certain situations or activities\n- Difficulty sleeping or frequent nightmares\n- Irritability or anger\n- Poor concentration or restlessness\n- Self-doubt or negative self-talk\n- Increased sensitivity to criticism or rejection\n\nIt's important to note that some anxiety is normal in children, especially during periods of change or stress. However, if your child's anxiety is persistent and interfering with their daily life, it may be time to seek professional help.\n\nTreatment Options for Anxiety in Children\n\nThere are a variety of treatment options available for children with anxiety. The best course of treatment will depend on the severity of your child's symptoms and their individual needs. Some common treatment options for anxiety in children include:\n\n- Cognitive-behavioral therapy (CBT): This is a type of therapy that helps children identify and change negative thought patterns and behaviors that contribute to their anxiety.\n- Exposure therapy: This type of therapy gradually exposes children to situations or activities that they fear, helping them to overcome their anxiety.\n- Medication: In some cases, medication may be prescribed to help manage symptoms of anxiety. However, medication is generally not recommended as a first-line treatment for children.\n\nIn addition to these treatment options, there are also things that you can do as a parent to help your child manage their anxiety. These include:\n\n- Creating a calm and supportive home environment\n- Encouraging healthy habits such as exercise and good sleep hygiene\n- Helping your child to develop coping strategies such as deep breathing, visualization, or mindfulness\n- Being a good listener and providing emotional support to your child\n\nConclusion\n\nAnxiety can be a challenging condition to deal with, but with the right treatment and support, children can learn to manage their symptoms and lead healthy, fulfilling lives. If you're concerned about your child's anxiety, don't hesitate to reach out to a mental health professional for help. With the right treatment and support, your child can overcome their anxiety and thrive."),
          image: "article_3",
          date: DateTime(
            2023,
            2,
            2,
          )),
      Article(
          uid: "uid_4",
          name: ArticleName(
              "Positive Discipline: Effective Strategies for Raising Well-Behaved child"),
          body: ArticleBody(
              "Disciplining children is one of the most challenging aspects of parenting. It can be difficult to know how to discipline your child in a way that is effective and positive. In this article, we'll explore the concept of positive discipline and effective strategies for raising well-behaved children.\n\nWhat is Positive Discipline?\n\nPositive discipline is a parenting approach that focuses on teaching children to make good choices rather than punishing them for bad behavior. It involves setting clear expectations, offering guidance and support, and reinforcing positive behavior with praise and rewards.\n\nEffective Strategies for Positive Discipline\n\n1. Set clear expectations: Children need clear boundaries and expectations to feel secure. Make sure your child knows what is expected of them and what the consequences will be if they don't follow the rules.\n\n2. Reinforce positive behavior: Rather than focusing on punishment, try to reinforce positive behavior with praise and rewards. This can help build your child's self-esteem and encourage good behavior.\n\n3. Use natural consequences: Natural consequences are the natural result of a child's behavior. For example, if your child forgets their homework, they may receive a lower grade. Natural consequences help teach children to take responsibility for their actions.\n\n4. Use logical consequences: Logical consequences are consequences that are directly related to a child's behavior. For example, if your child breaks a toy, they may need to help pay for a replacement. Logical consequences help children learn from their mistakes and make amends for their actions.\n\n5. Offer guidance and support: Children need guidance and support to learn how to make good choices. Offer your child guidance and support as they learn to navigate the world around them.\n\nBy using positive discipline strategies, you can help your child develop the skills they need to make good choices and become well-behaved, responsible adults. Remember, positive discipline takes time and patience, but it is well worth the effort in the long run."),
          image: "article_4",
          date: DateTime(
            2023,
            1,
            22,
          )),
      Article(
          uid: "uid_5",
          name: ArticleName(
              "Fostering Creativity in Children: Tips and Strategies"),
          body: ArticleBody(
              "Creativity is an important skill that can help children succeed in all areas of life. By fostering creativity in your child, you can help them develop problem-solving skills, improve their self-esteem, and think outside the box. In this article, we'll explore some tips and strategies for fostering creativity in children.\n\n1. Provide opportunities for exploration and experimentation: Children learn by exploring and experimenting with the world around them. Offer your child opportunities to try new things, whether it's through art, music, or other creative activities.\n\n2. Encourage open-ended play: Open-ended play allows children to use their imaginations and think creatively. Provide your child with toys and materials that allow for open-ended play, such as blocks, art supplies, or dress-up clothes.\n\n3. Emphasize process over product: Instead of focusing on the end result, encourage your child to enjoy the process of creating. This can help them develop a love for the creative process and be more willing to take risks.\n\n4. Provide positive feedback: Positive feedback can help build your child's self-esteem and encourage them to continue being creative. Make sure to praise your child for their efforts, not just their accomplishments.\n\n5. Model creativity: Children learn by watching and imitating their parents. Make sure to model creativity in your own life, whether it's through cooking, writing, or other creative pursuits.\n\n6. Foster a love of learning: Creativity and learning go hand in hand. Encourage your child to explore their interests and learn about new topics. This can help spark their creativity and give them new ideas to explore.\n\nBy fostering creativity in your child, you can help them develop a valuable skill that will serve them well throughout their lives. Remember, creativity is not something that can be forced, but by providing the right environment and opportunities, you can help your child unleash their creative potential."),
          image: "article_5",
          date: DateTime(
            2023,
            1,
            15,
          )),
      Article(
          uid: "uid_6",
          name: ArticleName(
              "Baby Care 101: Tips for Taking Care of Your Newborn"),
          body: ArticleBody(
              "Bringing a newborn baby home can be both exciting and overwhelming. As a new parent, you want to do everything you can to make sure your baby is healthy, happy, and well-cared for. Here are some tips for taking care of your newborn:\n\n1. Feeding: Newborns typically need to eat every 2-3 hours, so be prepared for frequent feedings. Whether you choose to breastfeed or bottle-feed, make sure your baby is getting enough milk to keep them satisfied.\n\n2. Diapering: Newborns go through a lot of diapers, so be prepared to change them frequently. Make sure to clean the diaper area thoroughly and apply diaper cream to prevent diaper rash.\n\n3. Sleeping: Newborns need a lot of sleep, but they also wake up frequently. Create a safe sleep environment for your baby, such as a bassinet or crib with a firm, flat mattress and no soft bedding or toys.\n\n4. Bathing: Newborns don't need to be bathed every day, but they do need to be kept clean. Use a soft, damp washcloth to clean their face, neck, and diaper area.\n\n5. Bonding: Bonding with your baby is important for both you and your baby's emotional well-being. Spend time holding, cuddling, and talking to your baby to build a strong bond.\n\n6. Safety: Always keep your baby safe by using a car seat in the car, placing them on their back to sleep, and keeping small objects out of their reach.\n\nBy following these tips, you can ensure that your baby is healthy, happy, and well-cared for. Remember, being a new parent is a learning experience, so don't be afraid to ask for help or advice when you need it."),
          image: "article_6",
          date: DateTime(
            2023,
            1,
            8,
          )),
      Article(
          uid: "uid_7",
          name: ArticleName(
              "The Benefits of Mindful Parenting: How Being Present Can Help You and Your Child"),
          body: ArticleBody(
              "Parenting can be stressful, but practicing mindfulness can help you stay calm and present in the moment. Mindful parenting involves being fully engaged and attentive to your child, without judgment or distraction. Here are some of the benefits of practicing mindful parenting:\n\n1. Reducing stress: Mindful parenting can help reduce stress and anxiety, both for you and your child. By staying present in the moment, you can let go of worries about the future or regrets about the past.\n\n2. Improving communication: Mindful parenting can help improve communication between you and your child. By being fully present and attentive, you can better understand your child's needs and respond with empathy and understanding.\n\n3. Enhancing parent-child bonding: Mindful parenting can help enhance the bond between you and your child. By being present and engaged, you can create meaningful moments of connection that strengthen your relationship.\n\n4. Modeling healthy behavior: Mindful parenting can also help model healthy behavior for your child. By practicing self-care and staying present in the moment, you can teach your child valuable life skills that they can carry with them into adulthood.\n\n5. Improving emotional regulation: Mindful parenting can help improve your ability to regulate your emotions, which can in turn help your child regulate their own emotions.\n\n6. Enhancing empathy: Mindful parenting can help enhance your ability to feel and express empathy, which can help your child feel seen and understood.\n\n7. Encouraging positive discipline: Mindful parenting can help encourage positive discipline strategies, such as using natural consequences and setting clear boundaries.\n\n8. Reducing burnout: Mindful parenting can help reduce the risk of parental burnout by encouraging self-care and self-compassion.\n\n9. Supporting child development: Mindful parenting can support your child's cognitive, emotional, and social development by providing a safe and supportive environment.\n\n10. Creating a positive family culture: Mindful parenting can help create a positive family culture based on respect, empathy, and emotional intelligence.\n\nBy practicing mindful parenting, you can enjoy a wide range of benefits for both you and your child. Remember to approach mindfulness as a practice, rather than a destination, and be patient and kind to yourself as you work on staying present in the moment."),
          image: "article_7",
          date: DateTime(
            2023,
            1,
            1,
          )),
      Article(
          uid: "uid_8",
          name: ArticleName(
              "Navigating Screen Time for Kids: Tips and Guidelines for Healthy Technology Use"),
          body: ArticleBody(
              "With technology becoming more and more prevalent in our daily lives, it's important for parents to set guidelines around screen time for their kids. Here are some tips and guidelines for healthy technology use:\n\n1. Set limits: Set time limits on how much screen time your child can have each day, and stick to them. The American Academy of Pediatrics recommends no more than one hour of screen time per day for children ages 2 to 5, and no more than two hours per day for children ages 6 and up.\n\n2. Monitor content: Monitor the content your child is consuming and make sure it's age-appropriate. Use parental controls to block inappropriate content and limit access to certain websites or apps.\n\n3. Encourage physical activity: Encourage your child to take breaks from screen time and engage in physical activity. This will help promote a healthy lifestyle and reduce the risk of obesity and other health issues.\n\n4. Promote social interaction: Limiting screen time can help promote social interaction and communication skills. Encourage your child to engage in activities that involve face-to-face interaction with others.\n\n5. Be a role model: Model healthy screen time habits for your child. Limit your own screen time and engage in activities that don't involve technology.\n\n6. Create tech-free zones: Create certain areas of your home that are designated as tech-free zones, such as the dinner table or the bedroom.\n\n7. Use technology together: Use technology as a way to bond with your child. Play video games together or watch a movie as a family.\n\n8. Avoid screen time before bedtime: Avoid screen time before bedtime, as it can interfere with sleep patterns and affect your child's health and well-being.\n\n9. Talk to your child about screen time: Have open and honest conversations with your child about screen time and its effects on their health and well-being.\n\n10. Stay informed: Stay up-to-date on the latest research and guidelines surrounding screen time for kids, and adjust your approach accordingly.\n\nBy following these tips and guidelines, you can help your child develop healthy technology habits that will serve them well throughout their lives."),
          image: "article_8",
          date: DateTime(
            2022,
            11,
            24,
          )),
      Article(
          uid: "uid_9",
          name: ArticleName(
              "Building Resilience in Children: Strategies and Tips for Raising Strong and Confident Kids"),
          body: ArticleBody(
              "Resilience is the ability to bounce back from adversity, and it's a skill that can be developed and strengthened over time. Here are some strategies and tips for building resilience in children:\n\n1. Encourage problem-solving: Encourage your child to find solutions to problems on their own, rather than always jumping in to fix things for them. This will help them develop problem-solving skills and a sense of independence.\n\n2. Foster a growth mindset: Help your child develop a growth mindset by focusing on effort and improvement rather than innate ability. This will help them develop a love of learning and a willingness to take on challenges.\n\n3. Teach coping skills: Teach your child healthy coping skills, such as deep breathing, mindfulness, and physical exercise. This will help them manage stress and anxiety in a healthy way.\n\n4. Build a support system: Help your child build a support system of family, friends, and mentors who can offer guidance and encouragement.\n\n5. Model resilience: Model resilience for your child by handling adversity with grace and perseverance. This will help them see that resilience is a valuable and attainable skill.\n\n6. Celebrate failures: Celebrate your child's failures as learning opportunities, rather than sources of shame or embarrassment. This will help them develop a healthy attitude toward setbacks and challenges.\n\n7. Encourage healthy risk-taking: Encourage your child to take healthy risks, such as trying new things or speaking up for themselves. This will help them develop confidence and a sense of adventure.\n\n8. Foster independence: Encourage your child to be independent and self-sufficient, by giving them age-appropriate responsibilities and opportunities to make decisions.\n\n9. Practice gratitude: Encourage your child to practice gratitude by focusing on the positive aspects of their life and expressing appreciation for the people and things they have.\n\n10. Stay positive: Stay positive and optimistic, even in the face of adversity. This will help your child develop a positive outlook on life and a belief in their own ability to overcome challenges.\n\nBy following these strategies and tips, you can help your child build resilience and develop the skills they need to become strong and confident individuals."),
          image: "article_9",
          date: DateTime(
            2022,
            10,
            19,
          )),
      Article(
          uid: "uid_10",
          name: ArticleName(
              "The Importance of Sleep for Child Development: Tips and Strategies for Establishing Healthy Sleep Habits"),
          body: ArticleBody(
              "Sleep is essential for a child's physical, emotional, and cognitive development. Here are some tips and strategies for establishing healthy sleep habits:\n\n1. Stick to a routine: Establish a consistent bedtime routine, and stick to it as much as possible. This will help your child's body and mind prepare for sleep.\n\n2. Create a calming environment: Create a calm, quiet, and dark environment for sleep. Use blackout curtains, white noise machines, and comfortable bedding to help your child feel relaxed and comfortable.\n\n3. Limit screen time: Avoid screen time before bedtime, as it can interfere with sleep patterns. The blue light emitted by screens can suppress the production of melatonin, a hormone that helps regulate sleep.\n\n4. Encourage physical activity: Encourage your child to engage in physical activity during the day, as it can help promote healthy sleep patterns.\n\n5. Monitor caffeine intake: Limit your child's caffeine intake, especially in the afternoon and evening. Caffeine can interfere with sleep and make it harder for your child to fall asleep.\n\n6. Adjust bedtime as needed: Adjust your child's bedtime as needed based on their age, activity level, and sleep needs. The American Academy of Pediatrics recommends the following sleep guidelines: 12-16 hours for infants, 11-14 hours for toddlers, 10-13 hours for preschoolers, and 9-12 hours for school-aged children.\n\n7. Avoid late-night snacks: Avoid giving your child large meals or snacks right before bedtime, as it can interfere with digestion and disrupt sleep.\n\n8. Teach relaxation techniques: Teach your child relaxation techniques such as deep breathing, visualization, or meditation to help them relax and fall asleep.\n\n9. Address sleep problems: Address any sleep problems or concerns with your child's pediatrician, who can offer guidance and advice.\n\n10. Be patient and consistent: Establishing healthy sleep habits takes time and patience. Be consistent in your approach and stick to your routine, even on weekends or during vacations.\n\nBy following these tips and strategies, you can help your child establish healthy sleep habits that will promote their physical, emotional, and cognitive development."),
          image: "article_10",
          date: DateTime(
            2022,
            10,
            19,
          )),
    ];

    return right(articles);
  }

  @override
  Future<Either<ArticleFailure, List<String>>> getFavoriteArticles() async {
    final articles = _favArticleBox.values.toList();
    return right(articles);
  }

  @override
  Future<Either<ArticleFailure, List<String>>> getSearchHistory() async {
    try {
      final searchHistory = _searchHistoryBox.values.toList().reversed.toList();
      return right(searchHistory);
    } on HiveError catch (_) {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> addSearchHistory(
      String searchTerm) async {
    try {
      if (!_searchHistoryBox.values.contains(searchTerm)) {
        await _searchHistoryBox.add(searchTerm);
      }
      return right(unit);
    } on HiveError catch (_) {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> deleteSearchHistory(
      String searchTerm) async {
    try {
      int index =
          _searchHistoryBox.values.toList().indexWhere((e) => e == searchTerm);
      if (index == -1) {
        return left(const ArticleFailure.unexpected());
      }
      await _searchHistoryBox.deleteAt(index);
      return right(unit);
    } on HiveError catch (_) {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> clearSearchHistory() async {
    try {
      await _searchHistoryBox.clear();
      return right(unit);
    } on HiveError catch (_) {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, List<Article>>> searchArticles(
      String searchTerm, List<Article> articles) async {
    try {
      List<Article> searchResults = articles
          .where((article) => article.name
              .getOrCrash()
              .toLowerCase()
              .contains(searchTerm.toLowerCase()))
          .toList();

      return right(searchResults);
    } catch (e) {
      return left(const ArticleFailure.unexpected());
    }
  }
}
