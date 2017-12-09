## Movie-Store
This app show the rating of movies .

## Workflow:
- xMovies Workflow
- xAuthentication
- Authorization
- xComments Section


## Model
- xmovie - title:string genre:string plot:text image:string rating:string web:string year:integer cast:text
- xUser - Devise
- xComment - movie_id:reference  user_id: reference comment: text
- xview - user:references


## UI
- xBootstrap

## Refactoring
- xmake common helper method for root page
