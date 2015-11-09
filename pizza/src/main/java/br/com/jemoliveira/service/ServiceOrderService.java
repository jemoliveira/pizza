package br.com.jemoliveira.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.jemoliveira.model.ServiceOrder;
import br.com.jemoliveira.repository.ServiceOrderRepository;

@Service
public class ServiceOrderService {

    @Autowired
    private ServiceOrderRepository serviceOrderRepository;

    public void save(ServiceOrder serviceOrder) {
    	serviceOrderRepository.save(serviceOrder);
    }
    
    public List<ServiceOrder> findAllByIsOpen() {
    	return serviceOrderRepository.findAllByIsOpen();        
    }
    
    public void updateSO(int id) {
    	serviceOrderRepository.updateSO(id);
    }
}
