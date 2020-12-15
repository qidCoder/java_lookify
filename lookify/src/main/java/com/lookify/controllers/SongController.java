package com.lookify.controllers;
//Songs song songService tService

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lookify.models.Song;
import com.lookify.services.SongService;

@Controller
public class SongController {
	//dependency injection
	// @Autowired
	// private TitleService tService;
	
	@Autowired
	private SongService songService;
	
	//ROUTES - same as the APIcontroller
//	@RequestMapping("/", method=RequestMethod.GET)
//	@RequestMapping("/")
	@GetMapping("/")
	public String index(Model viewModel) {//need model to display to frontend from DB
		List<Song> allSongs = this.songService.getAllSongs();//store everything in a list
		viewModel.addAttribute("allSongs", allSongs);
		
		return "index.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model viewModel) {//need model to display to frontend from DB
		List<Song> allSongs = this.songService.getAllSongs();//store everything in a list
		viewModel.addAttribute("allSongs", allSongs);
		
		return "dashboard.jsp";
	}
	
	//add a song
	@GetMapping("/add")
	public String addSong(@ModelAttribute("song") Song song) {//need to add this parameter to use the validations - it basically creates an empty object that the user will fill out
		return "add.jsp";		
	}
	
	@PostMapping("/add")
	public String addSong(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		//the @Valid will check against the validations created in Song.java
		//BindingResult is if something goes wrong in the validation from the songs, BindingResult will catch it
		if(result.hasErrors()) {
			return "add.jsp";//re-render the page if there are errors
		}
		this.songService.createSong(song);
		return "redirect:/dashboard";
	}
	
	@PostMapping("/addOldWay")
	public String addSongToDB(@RequestParam("title") String title,
			@RequestParam("artist") String artist,
			@RequestParam("rating") int rating,
			RedirectAttributes redirectAttr) {
		System.out.println(title + artist + rating);
		
		//validations
		//create a list
		ArrayList<String> errors = new ArrayList<String>();
		if(title.equals("")) {
			errors.add("Hey, you forgot to add a title!");
		}
		if(artist.equals("")) {
			errors.add("Hey, you forgot to add a artist!");
		}
		if(rating == 0) {
			errors.add("Hey, you forgot to add a rating!");
		}
		if(errors.size() > 0) {
			//if there are errors, loop
			for(String e: errors) {
				redirectAttr.addFlashAttribute("errors", e);
			}
			return "redirect:/add";
		}
		
		
		this.songService.createSongOldway(title, artist, rating);
		
		return "redirect:/";	
	}
	
	//edit and update the song and show it all on the same page
	@GetMapping("/{id}")
	public String displaySong(@PathVariable("id") Long id, Model viewModel) {
		viewModel.addAttribute("song", songService.getSingleSong(id));
		
		return "show.jsp";
	}
	
	//edit and update the song and show it all on the same page
	@GetMapping("/delete/{id}")
	public String deleteSong(@PathVariable("id") Long id) {
		this.songService.deleteSong(id);
		
		return "redirect:/dashboard";
	}
	
	//top ten songs
	@GetMapping("/topten")
	public String topten(Model viewModel) {//need model to display to frontend from DB
		List<Song> topSongs = this.songService.topSongs();//store everything in a list
		viewModel.addAttribute("topSongs", topSongs);
		
		return "topten.jsp";
	}
	
	
//	find song by artist name	
	@RequestMapping("/search")
	public String searchArtist(Model model,@RequestParam(value="artist", required=false) String artist) {
		List<Song> songsByArtist = songService.searchArtist(artist);
		
		model.addAttribute("songsByArtist", songsByArtist);
		model.addAttribute("artist", artist);
		
		return "search.jsp";
	}

							
	
	
}
