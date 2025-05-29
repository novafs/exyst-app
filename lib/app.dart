import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'screens/onboarding/splash_screen.dart';
import 'screens/onboarding/welcome_screen.dart';
import 'screens/onboarding/login_screen.dart';
import 'screens/onboarding/register_screen.dart';
import 'screens/onboarding/forgot_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/course/course_details_screen.dart';
import 'screens/course/my_courses_screen.dart';
import 'screens/course/course_player_screen.dart';
import 'screens/course/certificate_screen.dart';
import 'screens/course/certificates_list_screen.dart';
import 'screens/course/category_courses_screen.dart';
import 'screens/course/wishlist_screen.dart';
import 'screens/home/explore_screen.dart';
import 'screens/home/notification_screen.dart';
import 'screens/home/discussion_forum_screen.dart';
import 'screens/profile/user_profile_screen.dart';
import 'screens/profile/edit_profile_screen.dart';
import 'screens/profile/progress_screen.dart';
import 'screens/profile/payment_history_screen.dart';
import 'screens/payment/checkout_screen.dart';
import 'screens/instructor/become_instructor_screen.dart';
import 'screens/instructor/instructor_dashboard_screen.dart';
import 'screens/instructor/create_course_screen.dart';
import 'screens/instructor/course_content_screen.dart';
import 'screens/instructor/course_pricing_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/settings/profile_information_screen.dart';
import 'screens/settings/change_password_screen.dart';
import 'screens/settings/linked_accounts_screen.dart';
import 'screens/settings/faq_screen.dart';
import 'screens/settings/language_theme_screen.dart';
import 'screens/settings/help_center_screen.dart';
import 'screens/settings/contact_support_screen.dart';
import 'screens/settings/feedback_rating_screen.dart';
import 'screens/settings/terms_of_service_screen.dart';
import 'screens/settings/privacy_policy_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'ExyLearn',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.lightTheme,
            darkTheme: themeProvider.darkTheme,
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/splash',
            routes: {
              '/splash': (context) => const SplashScreen(),
              '/welcome': (context) => const WelcomeScreen(),
              '/login': (context) => const LoginScreen(),
              '/register': (context) => const RegisterScreen(),
              '/forgot-password': (context) => const ForgotPasswordScreen(),
              '/home': (context) => const HomeScreen(),
              '/explore': (context) => const ExploreScreen(),
              '/my-courses': (context) => const MyCoursesScreen(),
              '/course-details': (context) => const CourseDetailsScreen(),
              '/course-player': (context) => const CoursePlayerScreen(),
              '/certificate': (context) => const CertificateScreen(),
              '/certificates-list': (context) => const CertificatesListScreen(),
              '/category-courses':
                  (context) =>
                      const CategoryCoursesScreen(category: 'Programming'),
              '/wishlist': (context) => const WishlistScreen(),
              '/notifications': (context) => const NotificationScreen(),
              '/discussion-forum': (context) => const DiscussionForumScreen(),
              '/profile': (context) => const UserProfileScreen(),
              '/edit-profile': (context) => const EditProfileScreen(),
              '/progress': (context) => const ProgressScreen(),
              '/payment-history': (context) => const PaymentHistoryScreen(),
              '/checkout': (context) => const CheckoutScreen(),
              '/become-instructor': (context) => const BecomeInstructorScreen(),
              '/instructor-dashboard':
                  (context) => const InstructorDashboardScreen(),
              '/create-course': (context) => const CreateCourseScreen(),
              '/course-content': (context) => const CourseContentScreen(),
              '/course-pricing': (context) => const CoursePricingScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/profile-information':
                  (context) => const ProfileInformationScreen(),
              '/change-password': (context) => const ChangePasswordScreen(),
              '/linked-accounts': (context) => const LinkedAccountsScreen(),
              '/faq': (context) => const FAQScreen(),
              '/language-theme': (context) => const LanguageThemeScreen(),
              '/help-center': (context) => const HelpCenterScreen(),
              '/contact-support': (context) => const ContactSupportScreen(),
              '/feedback-rating': (context) => const FeedbackRatingScreen(),
              '/terms-of-service': (context) => const TermsOfServiceScreen(),
              '/privacy-policy': (context) => const PrivacyPolicyScreen(),
            },
          );
        },
      ),
    );
  }
}
