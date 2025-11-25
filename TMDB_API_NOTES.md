# TMDB API Integration Notes

## Overview

The Movie Database (TMDB) API is a free, comprehensive API for accessing movie and TV show data including posters, ratings, release dates, and more.

## Key Information

### API Endpoints

1. **Search Movies Endpoint**
   - URL: `https://api.themoviedb.org/3/search/movie`
   - Method: GET
   - Required Parameters:
     - `query` (string): The movie name to search for
     - `api_key` (string): Your TMDB API key
   - Optional Parameters:
     - `include_adult` (boolean): Include adult movies (default: false)
     - `language` (string): Language code (default: en-US)
     - `page` (int): Page number for pagination (default: 1)

2. **Response Format**
   - Returns a JSON object with:
     - `page` (integer): Current page number
     - `results` (array): Array of movie objects
     - `total_pages` (integer): Total number of pages
     - `total_results` (integer): Total number of results

3. **Movie Object Structure**
   - `id` (integer): Unique movie ID
   - `title` (string): Movie title
   - `poster_path` (string): Relative path to poster image (e.g., "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg")
   - `release_date` (string): Release date (YYYY-MM-DD format)
   - `overview` (string): Movie description
   - `vote_average` (number): Average rating (0-10)
   - `vote_count` (integer): Number of votes
   - `popularity` (number): Popularity score
   - `backdrop_path` (string): Path to backdrop image

### Image URLs

To display poster images, construct the URL as:
```
https://image.tmdb.org/t/p/w500{poster_path}
```

Where `w500` is the width (can be w300, w500, w780, etc.)

## Getting an API Key

1. Visit: https://developer.themoviedb.org/docs/getting-started
2. Create a TMDB account
3. Go to account settings and click "API"
4. Register for an API key
5. Agree to the terms of use
6. Copy your API key

## Rate Limiting

- TMDB enforces rate limiting on the API
- Check documentation for current limits

## Free Tier

- TMDB API is completely free for non-commercial use
- No credit card required
- Perfect for our movie downloader application

## Implementation Plan

1. Store TMDB API key in environment variables
2. Create a backend procedure to search movies using the TMDB API
3. Display results with posters in the frontend
4. Integrate with existing download functionality
