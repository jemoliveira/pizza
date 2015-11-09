package br.com.jemoliveira.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import br.com.jemoliveira.model.ServiceOrder;

public interface ServiceOrderRepository extends CrudRepository<ServiceOrder, Integer> {
	
	@Query("SELECT p FROM ServiceOrder p order by p.isOpen desc")
	List<ServiceOrder> findAllByIsOpen();
	
	@Modifying
	@Query("update ServiceOrder u set u.isOpen=false where u.id=?1")
	@Transactional
	void updateSO(int id);

}