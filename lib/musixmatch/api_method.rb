# frozen_string_literal: true

module APIMethod
  def chart_artists_get(params = {})
    http.get("/ws/#{api_version}/chart.artists.get", _params(params))
  end

  def chart_tracks_get(params = {})
    http.get("/ws/#{api_version}/chart.tracks.get", _params(params))
  end

  def track_search(params = {})
    http.get("/ws/#{api_version}/track.search", _params(params))
  end

  def track_get(params = {})
    http.get("/ws/#{api_version}/track.get", _params(params))
  end

  def track_lyrics_get(params = {})
    http.get("/ws/#{api_version}/track.lyrics.get", _params(params))
  end

  def track_snippet_get(params = {})
    http.get("/ws/#{api_version}/track.snippet.get", _params(params))
  end

  def track_subtitle_get(params = {})
    http.get("/ws/#{api_version}/track.subtitle.get", _params(params))
  end

  def track_richsync_get(params = {})
    http.get("/ws/#{api_version}/track.richsync.get", _params(params))
  end

  def track_lyrics_translation_get(params = {})
    http.get("/ws/#{api_version}/track.lyrics.translation.get", _params(params))
  end

  def track_subtitle_translation_get(params = {})
    http.get("/ws/#{api_version}/track.subtitle.translation.get", _params(params))
  end

  def music_genres_get(params = {})
    http.get("/ws/#{api_version}/music.genres.get", _params(params))
  end

  def matcher_lyrics_get(params = {})
    http.get("/ws/#{api_version}/matcher.lyrics.get", _params(params))
  end

  def matcher_track_get(params = {})
    http.get("/ws/#{api_version}/matcher.track.get", _params(params))
  end

  def matcher_subtitle_get(params = {})
    http.get("/ws/#{api_version}/matcher.subtitle.get", _params(params))
  end

  def artist_get(params = {})
    http.get("/ws/#{api_version}/artist.get", _params(params))
  end

  def artist_search(params = {})
    http.get("/ws/#{api_version}/artist.search", _params(params))
  end

  def artist_albums_get(params = {})
    http.get("/ws/#{api_version}/artist.albums.get", _params(params))
  end

  def artist_related_get(params = {})
    http.get("/ws/#{api_version}/artist.related.get", _params(params))
  end

  def album_get(params = {})
    http.get("/ws/#{api_version}/album.get", _params(params))
  end

  def album_tracks_get(params = {})
    http.get("/ws/#{api_version}/album.tracks.get", _params(params))
  end

  def tracking_url_get(params = {})
    http.get("/ws/#{api_version}/tracking.url.get", _params(params))
  end

  def catalogue_dump_get(params = {})
    http.get("/ws/#{api_version}/catalogue.dump.get", _params(params))
  end

  def _params(params)
    params['apikey'] = @api_key
    params['format'] = 'json'
    params
  end
  private :_params
end
