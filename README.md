## Movie-Store
This app show the rating of movies .

## Workflow:
- Movies Workflow
- Authentication
- Authorization
- Comments Section


## Model
- movie - title:string genre:string plot:text image:string rating:string web:string year:integer cast:text
- User - Devise
- Comment - movie_id:reference  user_id: reference comment: text
- view - user:references


## UI
- xBootstrap

## Refactoring
- xmake common helper method for root page
