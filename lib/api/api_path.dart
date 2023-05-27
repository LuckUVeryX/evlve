class ApiPath {
  const ApiPath._();

  static const baseUrl = 'https://api.evolvegenius.com';
  static const origin = 'https://book.evolve-mma.com';
  static const referer = 'https://book.evolve-mma.com/';

  // * Booking
  static const sessions = '/booking/sessions';
  static const getEvents = '/booking/get-events';
  static const getMemberships = '/booking/get-memberships';
  static const bookClass = '/booking/book-class';
}
