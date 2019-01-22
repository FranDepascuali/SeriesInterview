# Series Interview
Exercise to show my coding skills

## Screencast
![series](https://user-images.githubusercontent.com/12101394/51504225-97d7ba00-1dbe-11e9-9882-ffe008367cb4.gif)


## Implemented
1. List of series
2. Detailed view
3. Obtain the genre from API
4. Subscribe to a serie (locally)

## Missing & bugs
1. ScrollView in details scrolls the whole content. I couldn't figure out how the transition should be from the images.
2. Search feature
3. Pagination feature
4. Spinners are missing for the requests
5. Errors are not handled
6. Degrade in shows list is missing
7. URL was fixed, but it should be retrieved from the API.

## Bootstrap
* Clone this repo.
* run ```pod install```
* (You may have some issues with certificates. Just change them.)

## Flow
I've used in other projects the concept of `Coordinator`, but it was too overkill for this example. Check how the file structure indicates the flow inside the app

## Description
I usually design `Components` as a combination of 3 different things:
```
UIViewController's subclass
ViewModel
UIView's subclass
```
A screen can be made of more than one component, check [MainViewController](https://github.com/FranDepascuali/SeriesInterview/blob/master/Series/Main/MainViewController.swift). 

### UIViewController's subclass
The controller coordinates the `view` with the `ViewModel`. Basically, it acts as delegate and binds the `ViewModel` to the `View`.

### ViewModel
Here's the logic. The `ViewModel` receives its dependencies via Dependency Injection, so they can then be tested. 

### UIView's subclass
Contains all the constraints and view styling

## Testing
Maybe [ShowDetailsViewModelSpec](https://github.com/FranDepascuali/SeriesInterview/blob/master/SeriesTests/Main/AllShows/ShowDetails/ShowDetailsViewModelSpec.swift) is the better example of how I test `ViewModels`. 
