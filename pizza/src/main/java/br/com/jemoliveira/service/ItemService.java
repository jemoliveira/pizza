package br.com.jemoliveira.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.jemoliveira.model.Item;
import br.com.jemoliveira.repository.ItemRepository;

@Service
public class ItemService {

    @Autowired
    private ItemRepository itemRepository;

    public List<Item> findByCategory(String category) {
        return itemRepository.findByCategory(category);
    }
}
