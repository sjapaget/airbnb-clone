AirBnB clone to practice for the post-wagon certification

To do:

Generate models:
- bicycles => title, category, description, price:integer, size: integer, photo, user_id:references
- bookings => bicycle_id:references, user_id:references, start_date:date, end_date:date
- reviews => rating:integer, content, booking_id:references, user_id:references

- Generate bicycles controller (all 7 crud actions)
- Generate bookings controller (new, create, index, show, destroy)
- Generate reviews controller (new, create, index, destroy)
User Stories:

I can add a bicycle to rent []
I can edit the details of a bicycle I'm offering to rent []
I can remove a bicycle I'm offering for rent []

I can rent a bicycle on the app for a fixed period []
I can remove a rental I have reserved on the app []

I can leave a review of a bicycle I have previously rented []
I can remove a review I have left of a bicycle []
