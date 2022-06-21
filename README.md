### About Kanaku
[Kanaku](http://www.kanaku.me) is a travel companion app which allows users to plot their own routes between relevant venues in a city of their choice. The route returned features a travel time estimation (by foot) along with optional turn-by-turn directions and geolocation, made possible by the [Mapbox navigation API](https://docs.mapbox.com/api/navigation/). 

### Target Audience
We made this app for travellers who love to throw caution to the wind and visit unfamiliar cities. It's not just for travellers, though. Whether you're in a foreign city or your hometown, Kanaku will show you everything that's on offer!

### The Problem
What many people find when they travel is that there isn't an easy way to both browse interesting venues and make a day/night plan in the same place. Currently, a user has to find a venue that interests them on Google, get directions to the venue, and repeat the process each time they want to move.
<br> <br>
We set out to unify this process: Kanaku shows the user venues that might interest them and also tells them the quickest way to get between each of these stops. Kanaku allows users to go from A to B to C no matter what the venues have to offer. Museum -> Night Club -> Museum? No problem. You just need to be able to walk it!

### The Process
Before we started this project, the team worked together to build an Airbnb clone app. This app (which can be found [here](https://github.com/HuseynHajiyev/rent-a-car/)) helped us to understand our individual strengths and weaknesses and ensured that everyone was doing work they were capable of for the final project.
<br> <br>
Before we wrote any code, we used a few apps to properly wireframe and ensure that our project model made sense both code-wise and user-wise:
<ul>
  <li>Figma</li>
  <li>Trello</li>
  <li>Le Wagon's DB Schema tool</li>
</ul>

We built this app using the Rails framework. Lots of Stimulus was used to make a few of our buttons (and maps!) work as intended.

### Strengths
<ul>
  <li>A mobile web app which works best when users are on the move</li>
  <li>Clean design with an easy-to-follow user journey</li>
  <li>Users can search by city or by venue to receive results relevant to their interests</li>
  <li>Structured in such a way that users can store past journeys - your trips are never lost!</li>
</ul>

### Current Limitations
<ul>
  <li>Venues are currently only seeded, since we rely on users to list their own businesses / establishments</li>
  <li>Mapbox only permits up to 25 "waypoints" on their directions API, placing a hard limit upon user journeys</li>
  <li>Currently there is no optimisation of routes, as mapbox automatically plots by order rather than by proximity</li>
  <li>No algorithm for "recommended venues", meaning that the user does not receive personalised venues and route ideas</li>
</ul>

### Credits
This app was made with a lot of love by the Kanaku team:
<ul>
  <li><a href="https://github.com/HuseynHajiyev">Huseyn</a></li>
  <li><a href="https://github.com/wvala">Will</a></li> 
  <li><a href="https://github.com/HarryStan7">Harry</a></li> 
  <li><a href="https://github.com/RAbuRabie">Rawia</a></li> 
</ul

We built this app as our final project @ Le Wagon, remote batch #894. If you have any questions, please don't hesitate to contact us!
