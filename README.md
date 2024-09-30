MVVM iOS Project without third-party SDKs.

The application requests and retrieves information from a local JSON server and stores it in a local database (the application can function offline). It contains a native network layer and uses CoreData for the database. The app displays a list in a table view, where each cell contains a title and an image. When a cell is tapped, the original image is previewed. Pagination is used to request and display the first 20 items, with additional items being requested and updated in CoreData via a NSFetchedResultsController as the user scrolls to the last cells.

Database json example.
{
  "photos": [
  {
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "reprehenderit est deserunt velit ipsam",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "https://via.placeholder.com/150/771796"
  },
}
