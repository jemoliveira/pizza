package br.com.jemoliveira.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import br.com.jemoliveira.model.Item;

public interface ItemRepository extends CrudRepository<Item, Integer> {
	
	/*@Query("SELECT p FROM Item p WHERE p.category = :category")
    public List<Item> findByCategory(@Param("category") String category);*/
	
	List<Item> findByCategory(String category);
    
}