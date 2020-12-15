package com.lookify.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lookify.models.Song;
import com.lookify.services.SongService;

@RestController//Apis
@RequestMapping("/api")//prepends all the below access points
public class APISongController {
	//need access to the service - dependency injection
	private SongService songService;
	
	public APISongController(SongService service) {
		this.songService = service;
	}
	
	//Routes
	@RequestMapping("")
	public List<Song> index(){
		return this.songService.getAllSongs();
	}
	
	@RequestMapping("/{id}")
	public Song getSong(@PathVariable("id") Long id) {
		return this.songService.getSingleSong(id);
	}
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public Song create(Song song) {
		return this.songService.createSong(song);
	}
	
//	@DeleteMapping("/delete/{id}")
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	public void deleteSong(@PathVariable("id") Long id) {
		this.songService.deleteSong(id);
	}
	
	@RequestMapping(value="/update/{id}", method=RequestMethod.PUT)
	public Song edit(@PathVariable("id") Long id, Song updatedSong) {
		return this.songService.updateSong(updatedSong);
	}
}
