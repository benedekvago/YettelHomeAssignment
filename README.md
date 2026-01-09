## Installation

The backend servie runs on the provided Docker container, the only important thing is to tunnel the Docker Container's port to localhost's port 8080, because the generated API is using that port when running the application.

The application was developed in XCode 16.3 for the minimum iOS target of 18.4. After cloning the repository and opening the .xcodeproj file with XCode the application should resolve it'§s dependencies and the be ready to main target should be ready to run

## Architecture

I mainly focused on creating maintainable, testable, modular and expandable architecture, which focuses on the coordinator pattern and follows strict layer separation practises through dependency inversion and the flow architecture.

## Improvement points

Because the lack of time the last components of the application inside the flows (meaning the Views and ViewModels) are not as well sturctured as the Application layer, the Navigation System, the ApiClient package and the UIComponents target for example. I would have used a bit more time to cut the Views to smaller pieces making the UI more modular, and I would have heavily refactored the ViewModels not to be confusing, introducing more abstraction to hide everything from the views they don't need.

I've written some unit tests, but these are far from enough, with more time I would have improved on the line coverage.

Currently I am using an MVVM pattern for the Views, but the domain models are exposed to the Views through the ViewModel. I would have loved to introduce more abstractions around these parts of the code for a cleaner separation of concerns.

There is basically no sophisticated error handling in the application, another improvement point is to introduce both global and local error handling solutions.

## Missing points

I did not have time to implement the notification for when the user selects counties that are not connected to eachother, but the architecture makes it relatively simple to implement the feautre in the future.

Also regarding the Map and the coloring, my solution is far from perfect, I just wanted to introduce the feature even if it's rough around the edges because of the lack of time and the complexity of the task.
