require 'spec_helper'

RSpec.describe Musixmatch do
  before do
    @api_key = if ENV['ENV'] === 'REAL_TEST'
      WebMock.disable!
      ENV['MUSIXMATCH_API_KEY']
    else
      'your_api_key'
    end

    WebMock.stub_request(:get, url).to_return(
      body: File.read(fixture),
      status: 200,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  let(:api_key) { @api_key }
  let(:musixmatch) { Musixmatch.new(api_key) }

  context 'chart_artists_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/chart.artists.get?apikey=#{api_key}&chart_name=top&country=it&f_has_lyrics=1&format=json&page=1&page_size=5" }
    let(:fixture) { 'spec/fixtures/chart_artists_get.json' }
    
    it 'request was successful' do
      res = musixmatch.chart_artists_get({ chart_name: 'top', page: 1, page_size: 5, country: 'it', f_has_lyrics: 1 })
      expect(res.body.message.body.key?('artist_list')).to be_truthy
    end
  end
 
  context 'chart_tracks_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/chart.tracks.get?apikey=#{api_key}&chart_name=top&country=it&f_has_lyrics=1&format=json&page=1&page_size=5" }
    let(:fixture) { 'spec/fixtures/chart_tracks_get.json' }
    
    it 'request was successful' do
      res = musixmatch.chart_tracks_get({ chart_name: 'top', page: 1, page_size: 5, country: 'it', f_has_lyrics: 1 })
      expect(res.body.message.body.key?('track_list')).to be_truthy
    end
  end

  context 'track_search' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/track.search?apikey=#{api_key}&format=json&page=1&page_size=3&q_artist=justin%20bieber&s_track_rating=desc" }
    let(:fixture) { 'spec/fixtures/track_search.json' }
    
    it 'request was successful' do
      res = musixmatch.track_search({ q_artist: 'justin bieber', page_size: 3, page: 1, s_track_rating: 'desc' })
      expect(res.body.message.body.key?('track_list')).to be_truthy
    end
  end

  context 'track_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/track.get?apikey=#{api_key}&format=json&commontrack_id=5920049" }
    let(:fixture) { 'spec/fixtures/track_get.json' }
    
    it 'request was successful' do
      res = musixmatch.track_get({ commontrack_id: 5920049 })
      expect(res.body.message.body.key?('track')).to be_truthy
    end
  end
  context 'track_lyrics_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/track.lyrics.get?apikey=#{api_key}&format=json&track_id=15953433" }
    let(:fixture) { 'spec/fixtures/track_lyrics_get.json' }
    
    it 'request was successful' do
      res = musixmatch.track_lyrics_get({ track_id: 15953433 })
      expect(res.body.message.body.key?('lyrics')).to be_truthy
    end
  end

  context 'track_snippet_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/track.snippet.get?apikey=#{api_key}&format=json&track_id=16860631" }
    let(:fixture) { 'spec/fixtures/track_snippet_get.json' }
    
    it 'request was successful' do
      res = musixmatch.track_snippet_get({ track_id: 16860631 })
      expect(res.body.message.body.key?('snippet')).to be_truthy
    end
  end

  context 'track_subtitle_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/track.subtitle.get?apikey=#{api_key}&format=json&commontrack_id=10074988" }
    let(:fixture) { 'spec/fixtures/track_subtitle_get.json' }
    
    it 'request was successful' do
      res = musixmatch.track_subtitle_get({ commontrack_id: 10074988 })
      expect(res.body.message.body.key?('subtitle')).to be_truthy
    end
  end

  context 'track_richsync_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/track.richsync.get?apikey=#{api_key}&format=json&track_id=114837357" }
    let(:fixture) { 'spec/fixtures/track_richsync_get.json' }
    
    it 'request was successful' do
      res = musixmatch.track_richsync_get({ track_id: 114837357 })
      expect(res.body.message.body.key?('richsync')).to be_truthy
    end
  end

  context 'track_lyrics_translation_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/track.lyrics.translation.get?apikey=#{api_key}&format=json&commontrack_id=10074988&selected_language=it" }
    let(:fixture) { 'spec/fixtures/track_lyrics_translation_get.json' }
    
    it 'request was successful' do
      res = musixmatch.track_lyrics_translation_get({ commontrack_id: 10074988, selected_language: 'it' })
      expect(res.body.message.body.key?('lyrics')).to be_truthy
    end
  end

  context 'track_subtitle_translation_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/track.subtitle.translation.get?apikey=#{api_key}&format=json&commontrack_id=10074988&selected_language=it" }
    let(:fixture) { 'spec/fixtures/track_subtitle_translation_get.json' }
    
    it 'request was successful' do
      res = musixmatch.track_subtitle_translation_get({ commontrack_id: 10074988, selected_language: 'it' })
      expect(res.body.message.body.key?('subtitle')).to be_truthy
    end
  end

  context 'music_genres_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/music.genres.get?apikey=#{api_key}&format=json" }
    let(:fixture) { 'spec/fixtures/music_genres_get.json' }
    
    it 'request was successful' do
      res = musixmatch.music_genres_get
      expect(res.body.message.body.key?('music_genre_list')).to be_truthy
    end
  end

  context 'matcher_lyrics_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/matcher.lyrics.get?apikey=#{api_key}&format=json&q_artist=lmfao&q_track=sexy and i know it" }
    let(:fixture) { 'spec/fixtures/matcher_lyrics_get.json' }
    
    it 'request was successful' do
      res = musixmatch.matcher_lyrics_get({ q_track: 'sexy and i know it', q_artist: 'lmfao' })
      expect(res.body.message.body.key?('lyrics')).to be_truthy
    end
  end

  context 'matcher_track_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/matcher.track.get?apikey=#{api_key}&format=json&q_artist=eminem&q_track=lose yourself (soundtrack)" }
    let(:fixture) { 'spec/fixtures/matcher_track_get.json' }
    
    it 'request was successful' do
      res = musixmatch.matcher_track_get({ q_artist: 'eminem', q_track: 'lose yourself (soundtrack)' })
      expect(res.body.message.body.key?('track')).to be_truthy
    end
  end

  context 'matcher_subtitle_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/matcher.subtitle.get?apikey=#{api_key}&format=json&q_track=sexy and i know it&q_artist=lmfao&f_subtitle_length=200&f_subtitle_length_max_deviation=3" }
    let(:fixture) { 'spec/fixtures/matcher_subtitle_get.json' }
    
    it 'request was successful' do
      res = musixmatch.matcher_subtitle_get({ q_track: 'sexy and i know it', q_artist: 'lmfao', f_subtitle_length: 200, f_subtitle_length_max_deviation: 3 })
      expect(res.body.message.body.key?('subtitle')).to be_truthy
    end
  end

  context 'artist_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/artist.get?apikey=#{api_key}&format=json&artist_id=118" }
    let(:fixture) { 'spec/fixtures/artist_get.json' }
    
    it 'request was successful' do
      res = musixmatch.artist_get({ artist_id: 118 })
      expect(res.body.message.body.key?('artist')).to be_truthy
    end
  end

  context 'artist_search' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/artist.search?apikey=#{api_key}&format=json&q_artist=prodigy&page_size=5" }
    let(:fixture) { 'spec/fixtures/artist_search.json' }
    
    it 'request was successful' do
      res = musixmatch.artist_search({ q_artist: 'prodigy', page_size:5 })
      expect(res.body.message.body.key?('artist_list')).to be_truthy
    end
  end

  context 'artist_albums_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/artist.albums.get?apikey=#{api_key}&format=json&artist_id=1039&s_release_date=desc&g_album_name=1" }
    let(:fixture) { 'spec/fixtures/artist_albums_get.json' }
    
    it 'request was successful' do
      res = musixmatch.artist_albums_get({ artist_id: 1039, s_release_date: 'desc', g_album_name: 1 })
      expect(res.body.message.body.key?('album_list')).to be_truthy
    end
  end

  context 'artist_related_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/artist.related.get?apikey=#{api_key}&format=json&artist_id=56&page_size=2&page=1" }
    let(:fixture) { 'spec/fixtures/artist_related_get.json' }
    
    it 'request was successful' do
      res = musixmatch.artist_related_get({ artist_id: 56, page_size: 2, page: 1 })
      expect(res.body.message.body.key?('artist_list')).to be_truthy
    end
  end

  context 'album_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/album.get?apikey=#{api_key}&format=json&album_id=14250417" }
    let(:fixture) { 'spec/fixtures/album_get.json' }
    
    it 'request was successful' do
      res = musixmatch.album_get({ album_id: 14250417 })
      expect(res.body.message.body.key?('album')).to be_truthy
    end
  end

  context 'album_tracks_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/album.tracks.get?apikey=#{api_key}&format=json&album_id=13750844&page=1&page_size=2" }
    let(:fixture) { 'spec/fixtures/album_tracks_get.json' }
    
    it 'request was successful' do
      res = musixmatch.album_tracks_get({ album_id: 13750844, page: 1, page_size: 2 })
      expect(res.body.message.body.key?('track_list')).to be_truthy
    end
  end

  context 'tracking_url_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/tracking.url.get?apikey=#{api_key}&format=json&domain=www.mylyricswebsite.com" }
    let(:fixture) { 'spec/fixtures/tracking_url_get.json' }
    
    it 'request was successful' do
      res = musixmatch.tracking_url_get({ domain: 'www.mylyricswebsite.com' })
      expect(res.body.message.body.key?('url')).to be_truthy
    end
  end

  context 'catalogue_dump_get' do
    let(:url) { "https://api.musixmatch.com/ws/#{musixmatch.api_version}/catalogue.dump.get?apikey=#{api_key}&format=json" }
    let(:fixture) { 'spec/fixtures/catalogue_dump_get.json' }
    
    it 'request was successful' do
      res = musixmatch.catalogue_dump_get
      expect(res.body.message.body.key?('catalogue')).to be_truthy
    end
  end
end
