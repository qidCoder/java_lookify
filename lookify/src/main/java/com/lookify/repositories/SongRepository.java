package com.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.lookify.models.Song;

@Repository
public interface SongRepository extends CrudRepository<Song, Long>{
	//SELECT * FROM songs
	List<Song> findAll();
	
    //find song by artist name
    List<Song> findByArtistContaining(String search);//NOTE: this is a built-in feature part of the CRUD repository
    
    // Top 10 songs in descending order
    List<Song> findTop10ByOrderByRatingDesc();//NOTE: this is a built-in feature part of the CRUD repository
}
