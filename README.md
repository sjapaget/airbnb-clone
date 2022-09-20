AirBnB clone to practice for the post-wagon certification

Notes:

Model descriptions:
- bicycle - represents a bicycle that belongs to a user, can be offered out to rent for specific periods (bookings) and can be rented by another user for a specific period (reservations)
- booking - a period of time in which a user decides to make their bicycle avaiable for rent.
- reservation - a period of time a user wishes to rent a bicycle for.
- review - belong to a reservation, user can leave one per reservation they have

TODO:

Generate models:
- bicycle => title, category, description, price:integer, size: integer, photo, user_id:references [X]
- booking => bicycle:references, start_date:date end_date:date [X]
- reservation => bicycle_id:references, user_id:references, start_date:date, end_date:date [X]
- review => rating:integer, content, reservation_id:references []

- Generate bicycles controller (all 7 crud actions)
- Generate bookings controller (new, create, index, show, destroy)
- Generate reviews controller (new, create, index, destroy)
User Stories:

I can see all the available bicycles [X]
I can add a bicycle to rent [X]
I can see the details of a specific bicycle []
I can edit the details of a bicycle I'm offering to rent []
I can remove a bicycle I'm offering for rent []

I can rent a bicycle on the app for a fixed period []
I can remove a rental I have reserved on the app []

I can leave a review of a bicycle I have previously rented []
I can remove a review I have left of a bicycle []
