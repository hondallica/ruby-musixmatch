# Musixmatch

musiXmatch API client library.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'musixmatch'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install musixmatch

## Usage

```ruby
require 'musixmatch'
```

### Setting API key
You must set the API key.

Please refer to the [official API documentation](https://developer.musixmatch.com/documentation) on how to get API key.

```ruby
musixmatch = Musixmatch.new('your_api_key')
```

If environment variable MUSIXMATCH_API_KEY is set in .bash_profile etc, no argument is necessary.

    export MUSIXMATCH_API_KEY=your_api_key

```ruby
musixmatch = Musixmatch.new
```

### change API key

```ruby
musixmatch.api_key = 'new_api_key'
```

### API Resources
It supports resources of musiXmatch API version 1.1.
Please refer to the [official API documentation](https://developer.musixmatch.com/documentation) for available parameters etc.

```ruby
res = musixmatch.chart_artists_get({ chart_name: 'top', page: 1, page_size: 5, country: 'it', f_has_lyrics: 1 })
res = musixmatch.chart_tracks_get({ chart_name: 'top', page: 1, page_size: 5, country: 'it', f_has_lyrics: 1 })
res = musixmatch.track_search({ q_artist: 'justin bieber', page_size: 3, page: 1, s_track_rating: 'desc' })
res = musixmatch.track_get({ commontrack_id: 5920049 })
res = musixmatch.track_lyrics_get({ track_id: 15953433 })
res = musixmatch.track_snippet_get({ track_id: 16860631 })
res = musixmatch.track_subtitle_get({ commontrack_id: 10074988 })
res = musixmatch.track_richsync_get({ track_id: 114837357 })
res = musixmatch.track_lyrics_translation_get({ commontrack_id: 10074988, selected_language: 'it' })
res = musixmatch.track_subtitle_translation_get({ commontrack_id: 10074988, selected_language: 'it' })
res = musixmatch.music_genres_get
res = musixmatch.matcher_lyrics_get({ q_track: 'sexy and i know it', q_artist: 'lmfao' })
res = musixmatch.matcher_track_get({ q_artist: 'eminem', q_track: 'lose yourself (soundtrack)' })
res = musixmatch.matcher_subtitle_get({ q_track: 'sexy and i know it', q_artist: 'lmfao', f_subtitle_length: 200, f_subtitle_length_max_deviation: 3 })
res = musixmatch.artist_get({ artist_id: 118 })
res = musixmatch.artist_search({ q_artist: 'prodigy', page_size:5 })
res = musixmatch.artist_albums_get({ artist_id: 1039, s_release_date: 'desc', g_album_name: 1 })
res = musixmatch.artist_related_get({ artist_id: 56, page_size: 2, page: 1 })
res = musixmatch.album_get({ album_id: 14250417 })
res = musixmatch.album_tracks_get({ album_id: 13750844, page: 1, page_size: 2 })
res = musixmatch.tracking_url_get({ domain: 'www.mylyricswebsite.com' })
res = musixmatch.catalogue_dump_get
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
