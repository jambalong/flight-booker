# Flight Booker

This project is part of The Odin Project: [Flight Booker](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker) in the Ruby on Rails curriculum.

## Learning Objectives

By the end of this project, you will be able to:

- Create a Rails application that allows users to search for and book flights.
- Implement forms with dropdown menus and nested attributes.
- Utilize Rails associations for managing related models.
- Seed a database with sample data for testing.
- Create a multi-step booking process with clear user interactions.

## Assignment Overview

1. **Search for Flights**: Users can enter desired dates and airports to search for available flights.
2. **Select Flight**: Users choose from a list of available flights returned based on their search criteria.
3. **Enter Passenger Information**: Collect passenger details for the booking.
4. **Billing Information**: Capture billing details for the transaction.

## Basic Setup

1. **Data Models**: Plan and create the necessary models: `Airport`, `Flight`, `Booking`, and `Passenger`.
2. **Create Rails App**: Generate your new Rails application, e.g., `odin-flight-booker`, and initialize a GitHub repository. Update your README to reflect your project.
3. **Database Seeding**: Use the `db/seeds.rb` file to populate airports and flights for testing.

## Features

### Search Screen
- Create dropdowns for departure airport, arrival airport, date, and number of passengers.
- Implement a search form on the `/flights` index page that submits using a GET request.

### Flight Selection
- Display search results on the same page with radio buttons for flight selection.
- Keep the search form active to allow new searches.

### Passenger Information
- Create a form to submit booking information and collect passenger details using nested attributes.
- Implement a `BookingsController` to handle booking logic and render a booking confirmation page.

## Technologies Used

- Ruby on Rails
- ActiveRecord for database management

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/jambalong/flight-booker.git
   ```

2. Navigate to the project directory:
   ```bash
   cd flight-booker
   ```

3. Install dependencies:
   ```bash
   bundle install
   ```

4. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. Start the Rails server:
   ```bash
   rails server
   ```

Access the application at `http://localhost:3000`.
