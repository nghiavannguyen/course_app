final List<String> whatYouWillLearn = [
  "Learn React from the ground up and finish the course as an advanced React developer",
  "Build multiple high-quality demo apps, including a fullstack app built with NextJS",
  "Join more than 900,000 students in this course & more than 3,000,000 students I taught across all my courses",
  "Build fullstack React apps with NextJS 14+",
];
final List<String> curriculum = [
  "Welcome To The Course! (Video - 1:00)",
  "What is ReactJS? And Why Would You Use It? (Video - 2:58)",
  "ReactJS vs 'Vanilla JavaScript': Why Use React? (Video - 3:42)",
  "Editing Our First React App (Video - 4:22)",
];
final List<String> courseIncludes = [
  "34 hours, 45 minutes on-demand video",
  "45 Quizzes",
  "61 Resources",
  "48 Articles",
  "Full lifetime access",
  "Access on mobile, desktop and TV",
  "37 Coding exercises",
  "Certificate of completion",
];
final List<String> requirements = [
  "JavaScript + HTML + CSS fundamentals are absolutely required",
  "You DON'T need to be a JavaScript expert to succeed in this course!",
  "ES6+ JavaScript knowledge is beneficial but not a must-have",
  "No prior React or any other JS framework experience is required",
];

final List<Instructor> instructors = const [
  Instructor(
    name: "Academind by Maximilian Schwarzmüller",
    title: "Online Education",
    avatarUrl: "https://avatar.iran.liara.run/public",
    rating: 4.6,
    reviewsCount: 771372,
    studentsCount: 3212718,
    coursesCount: 48,
    description:
        "Bundling the courses and now how successful instructors, Academind strives to deliver high quality online education. Online Education, Real-Life Success - that's what Academind stands for. Learn topics like web development, data analytics, and more.",
  ),
  Instructor(
    name: "Maximilian Schwarzmüller",
    title: "AWS certified, Professional Web Developer and Instructor",
    avatarUrl: "https://avatar.iran.liara.run/public",
    rating: 4.6,
    reviewsCount: 1280656,
    studentsCount: 3255050,
    coursesCount: 63,
    description:
        "Online Education, Real-Life Success - that's what Academind stands for. Learn topics like web development, data analytics, and more.",
  ),
];

final double studentFeedbackRating = 4.6;
final Map<int, int> ratingDistribution = {
  5: 64,
  4: 29,
  3: 5,
  2: 1,
  1: 1,
};

final List<StudentReview> studentReviews = const [
  StudentReview(
    userName: "Puneet Khera",
    rating: 5.0,
    comment: "great",
    timeAgo: "1 day ago",
  ),
  StudentReview(
    userName: "Nikhil Patel",
    rating: 4.0,
    comment: "Nice explanation",
    timeAgo: "2 days ago",
  ),
  StudentReview(
    userName: "Visweswaraiah Earlapalli",
    rating: 5.0,
    comment: "Looks like great content needs to every section",
    timeAgo: "2 days ago",
  ),
  StudentReview(
    userName: "Braxton McClellan",
    rating: 4.0,
    comment:
        "I'm not all the way through yet, but I'm noticing that for some things/quiz's are super easy, and some are very difficult to figure out. I would relate it to when I was ...",
    timeAgo: "3 days ago",
  ),
];

// Mô phỏng dữ liệu đánh giá (review)
class StudentReview {
  final String userName;
  final double rating;
  final String comment;
  final String timeAgo;

  const StudentReview({
    required this.userName,
    required this.rating,
    required this.comment,
    required this.timeAgo,
  });
}

// Mô phỏng dữ liệu giảng viên
class Instructor {
  final String name;
  final String title;
  final String avatarUrl;
  final double rating;
  final int reviewsCount;
  final int studentsCount;
  final int coursesCount;
  final String description;

  const Instructor({
    required this.name,
    required this.title,
    required this.avatarUrl,
    required this.rating,
    required this.reviewsCount,
    required this.studentsCount,
    required this.coursesCount,
    required this.description,
  });
}
