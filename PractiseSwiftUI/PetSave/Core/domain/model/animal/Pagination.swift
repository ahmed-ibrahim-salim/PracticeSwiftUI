/// Copyright (c) 2021 Razeware LLC
/// 
  

struct Pagination: Codable {
  let countPerPage: Int
  let totalCount: Int
  let currentPage: Int
  let totalPages: Int
}
