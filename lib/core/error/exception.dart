/// API Service Exception
class APIServiceException implements Exception {}

/// 5xx response status
class ServerException implements APIServiceException {}

/// 401 response status
class AuthorizationException implements APIServiceException {}

/// 403 response status
class ForbiddenException implements APIServiceException {}

/// 400 response status
class BadRequestException implements APIServiceException {}

/// Fail to parse Data to Model
class DataParsingException implements Exception {}
