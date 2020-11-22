MVVM iOS Project, without third party SDK. 

The Application request and take information from local json-server and place in local Database (application can works offline). Contains native network layer and CoreData database. Shows the list in the table view, every cell contain a title and an image and when tap on cell previews original image. Using pagination to request and show first 20 items and then request and update items from CoreData with fetchedResultController when user scroll down to last cells.


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
