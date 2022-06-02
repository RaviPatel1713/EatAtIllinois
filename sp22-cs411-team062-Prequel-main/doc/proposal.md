## EAT@Illinois

### Stage 1 - Project Proposal

#### Description
At the University of Illinois, we have lots of food options but there is a lack of resources to show what restaurants and what specific dishes are good. Students may be out late after studying or social events, and want a place to eat that is open and also serving high-quality food. We want to solve this problem by creating a website where students can find restaurants currently open that serve high-quality cuisine, based on other students' input. Students can browse the restaurants by various parameters, such as filtering by cuisine, opening/closing time, and viewing and rating the quality and value of individual dishes. 

#### Usefulness
This is useful because students can easily find food they like late at night, which can be difficult since many restaurants close by 9PM or earlier. Students usually end up choosing fast food, which is not always the healthiest or best-tasting option. Instead, using our app, they can find local food that tastes better based on other students' reviews. This is somewhat similar to Yelp or Google Maps, because students can see restaurants and reviews. However, it is different because it is focused on our community and individual dishes can be ranked. Other platforms typically only allow reviews at a restaurant level, not for each dish, so our experience will make it easy for students to find their favorite dishes at any time, not just a specific cuise.

#### Realness

The data for restaurant names and locations can be acquired from Google Maps and/or Yelp API. This gives us accuracte restaurant information in the U of I local vicinity, from which we can build the review system. We know these providers have accurate addresses, opening hours, and phone numbers, so our application will be reliable as well. The data for restaurant and dish reviews can be provided by student input, such as through a Google Form or other survey sent to friends and classmates to input their feedback. We can acquire more reviews by having a place to input user reviews on the web page to get more reviews on existing and new dishes, which will expand the database over time.

#### Functionality
Data stored: Customers table, Restaurants table, Dish table, Individual food reviews table, Purchases table

- Customers table stores information about each student's login data (NetId, email, etc)
- Restaurants table keeps track of all the restaurants in the area (cuisine, open/closing time, etc)
- Dish table lists every known dish served at a restaurant, regardless of reviews, linking it to the restaurant and to any reviews (if present)
- Individual food reviews table stores every dish logged by a Customer, with ratings (ex: can find best burrito in town, or worst pizza)
- Purchases table stores all the purchases entered by Customers, allowing for filtering by price/value, or to see popular dishes

Basic functions: Users can login, view/sort/filter restaurants by various parameters, and view purchases and reviews of specific dishes. They can also browse menu items available at each restaurant, or find the best restaurants for certain menu items or cuisines. Users can add reviews for dishes they purchased, and also submit modifications to restuarant information (such as if a restaurant changes its hours, or permanently closes down). Users can filter by dish type, cusine type, or price.

Some cool additions: We can add a map, so users can easily find the location without needing another website. Then, they can also see the closest restaurants to them. This can be accoplished with the Google Maps API and JavaScript React components. Another potential feature could be adding support to filter reviews for dishes by health, so that users can input how healthy a dish is and then later filter by healthiness. 

#### Mockup

<img width="1026" alt="image" src="https://media.github-dev.cs.illinois.edu/user/9290/files/48e1ac24-896e-4f79-b800-ebd9bf7e79c5">

#### Project Work Distribution

Main Tasks
- setup MySQL database on cloud platform            (wpark26)
- create script to scrape data into MySQL database      (manavs2)
- create frontend interface                         (shivenk2)
- develop backend logic and queries connected to frontend interface   (ravinp2)
