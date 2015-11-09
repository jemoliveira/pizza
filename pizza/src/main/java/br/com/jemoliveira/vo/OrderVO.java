package br.com.jemoliveira.vo;

import java.util.List;

import br.com.jemoliveira.model.Item;
import br.com.jemoliveira.model.ServiceOrder;

public class OrderVO {
    private int pagesCount;
    private long total;

    private String actionMessage;
    private String searchMessage;

    private List<Item> pizzas;
    private List<Item> drinks;
    private List<Item> desserts;
    private List<ServiceOrder> serviceOrders;

	public List<ServiceOrder> getServiceOrders() {
		return serviceOrders;
	}

	public void setServiceOrders(List<ServiceOrder> serviceOrders) {
		this.serviceOrders = serviceOrders;
	}

	public OrderVO() {
    }

	public int getPagesCount() {
		return pagesCount;
	}

	public void setPagesCount(int pagesCount) {
		this.pagesCount = pagesCount;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	public String getSearchMessage() {
		return searchMessage;
	}

	public void setSearchMessage(String searchMessage) {
		this.searchMessage = searchMessage;
	}

	public List<Item> getPizzas() {
		return pizzas;
	}

	public void setPizzas(List<Item> pizzas) {
		this.pizzas = pizzas;
	}

	public List<Item> getDrinks() {
		return drinks;
	}

	public void setDrinks(List<Item> drinks) {
		this.drinks = drinks;
	}

	public List<Item> getDesserts() {
		return desserts;
	}

	public void setDesserts(List<Item> desserts) {
		this.desserts = desserts;
	}
}