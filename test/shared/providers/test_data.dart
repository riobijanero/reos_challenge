import 'package:reos_challenge/shared/models/book.dart';

class TestData {
  static final Book cleanCode = Book(
    id: '1',
    title: 'Clean Code',
    author: 'Robert C. Martin',
    imageUrl: 'https://picsum.photos/300/400',
    publishDate: DateTime(2008, 8, 1),
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
  );
  static final Book cleanCoder = Book(
    id: '2',
    title: 'The Clean Coder',
    author: 'Robert C. Martin',
    imageUrl: 'https://picsum.photos/300/400',
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
    publishDate: DateTime(1980, 1, 1),
  );
  static final Book cleanArchitecture = Book(
    id: '3',
    title: 'Clean Architecture',
    author: 'Robert C. Martin',
    imageUrl: 'https://picsum.photos/300/400',
    publishDate: DateTime(1970, 1, 1),
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
  );
  static final Book algorithms = Book(
    id: '4',
    title: 'Introduction to Algorithms',
    author: 'Thomas H. Cormen',
    imageUrl: 'https://picsum.photos/300/400',
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
    publishDate: DateTime(
      2009,
      7,
      29,
    ),
  );
  static final Book structureAndInteroretationOfComputerPrograms = Book(
    id: '5',
    title: 'Structure and Interpretation of Computer Programs',
    author: 'Harold Abelson',
    imageUrl: 'https://picsum.photos/300/400',
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
    publishDate: DateTime(1996, 7, 25),
  );
  static final Book codeComplete = Book(
    id: '6',
    title: 'Code Complete: A Practical Handbook of Software Construction',
    author: 'Steve McConnell',
    imageUrl: 'https://picsum.photos/300/400',
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
    publishDate: DateTime(2004, 7, 7),
  );
  static final Book designPatterns = Book(
    id: '7',
    title: 'Design Patterns: Elements of Reusable Object-Oriented Software',
    author: 'Erich Gamma',
    imageUrl: 'https://picsum.photos/300/400',
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
    publishDate: DateTime(1997, 7, 1),
  );
  static final Book pragmaticProgrammer = Book(
    id: '8',
    title: 'The Pragmatic Programmer',
    author: 'David Thomas',
    imageUrl: 'https://picsum.photos/300/400',
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
    publishDate: DateTime(2019, 9, 13),
  );
  static final Book headFirst = Book(
    id: '9',
    title: 'Head First Design Patterns: A Brain-Friendly Guide',
    author: 'Eric Freeman',
    imageUrl: 'https://picsum.photos/300/400',
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
    publishDate: DateTime(2014, 1, 1),
  );
  static final Book refactoring = Book(
    id: '10',
    title: 'Refactoring: Improving the Design of Existing Code',
    author: 'Martin Fowler',
    imageUrl: 'https://picsum.photos/300/400',
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
    publishDate: DateTime(2018, 11, 29),
  );
  static final Book artOfComputerProgramming = Book(
    id: '11',
    title: 'The Art of Computer Programming',
    author: 'Donald E. Knuth',
    imageUrl: 'https://picsum.photos/300/400',
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
    publishDate: DateTime(2011, 3, 3),
  );
  static final Book artOfComputerProgramming2 = Book(
    id: '12',
    title: 'The Art of Computer Programming 2',
    author: 'Donald E. Knuth',
    imageUrl: 'https://picsum.photos/300/400',
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et.',
    publishDate: DateTime(2013, 3, 3),
  );

  static final List<Book> bookList = [
    cleanCode,
    cleanCoder,
    cleanArchitecture,
    algorithms,
    structureAndInteroretationOfComputerPrograms,
    codeComplete,
    designPatterns,
    pragmaticProgrammer,
    headFirst,
    refactoring,
    artOfComputerProgramming,
    artOfComputerProgramming2
  ];

  static final List<String> continueReadBookIdList = [
    '4',
    '5',
    '6',
  ];

  static final List<String> newBooksIdList = ['1', '2', '3'];
}
