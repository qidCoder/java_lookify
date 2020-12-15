package com.lookify.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lookify.models.Song;
import com.lookify.repositories.SongRepository;

@Service
public class SongService {
	//Dependency Injection
	private SongRepository songRepo;
	
	//constructor
	public SongService(SongRepository repo) {
		this.songRepo = repo;
	}
	
	//CRUD Methods
	//Get All Songs
	public List<Song> getAllSongs(){
		return this.songRepo.findAll();
	}
	
	//Get one song
	public Song getSingleSong(Long id) {
		return this.songRepo.findById(id).orElse(null);
	}
	
	//Create a song
	public Song createSong(Song newSong) {
		return this.songRepo.save(newSong);
	}
	
	//Create a song from parameters from a form
	public Song createSongOldway(String title, String artist, int rating) {
		Song newSong = new Song(title, artist, rating);
		//call on the repository
		return this.songRepo.save(newSong);
	}
	
	//Delete a song
	public void deleteSong(Long id) {
		this.songRepo.deleteById(id);
	}
	
	//Update a Song
	public Song updateSong(Song song) {
		return this.songRepo.save(song);
	}
	
    //find song by artist name
	public List<Song> searchArtist(String artist) {
		List<Song> songs = this.songRepo.findByArtistContaining(artist);
		return songs;
	}
    
    // Top 10 songs in descending order
	public List<Song> topSongs() {
		return this.songRepo.findTop10ByOrderByRatingDesc();
	}
}
