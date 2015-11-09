package br.com.jemoliveira.controller;
 
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.jemoliveira.model.Item;
import br.com.jemoliveira.model.ServiceOrder;
import br.com.jemoliveira.service.ItemService;
import br.com.jemoliveira.service.ServiceOrderService;
import br.com.jemoliveira.vo.OrderVO;

/*my controller*/

@Controller
@RequestMapping(value = "/")
public class HomeController {

	@Autowired
	private ItemService itemService;
	
	@Value("100")
    private int maxResults;

	@Autowired
	private ServiceOrderService serviceOrderService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("welcomePage");
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json")
    public ResponseEntity<?> update(@PathVariable("id") int id,
                                    @RequestBody ServiceOrder serviceOrder,                                    
                                    Locale locale) {
		serviceOrderService.updateSO(id);		
		return null;
    }

	@RequestMapping(method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<OrderVO> createSO(@RequestBody List<Item> list) {
		
		ServiceOrder so = new ServiceOrder();
		float total = 0;
		String itemCart = "";
		
		for (Item item : list) {
			total = total + item.getPrice();
			itemCart = itemCart.concat(item.getFlavor());
		}
		
		so.setPrice(total);
		so.setDescription(itemCart);
		so.setOpen(true);
		serviceOrderService.save(so);
		return null;		
	}

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
		OrderVO vo = new OrderVO();
		vo.setPizzas(itemService.findByCategory("pizza"));
		vo.setDrinks(itemService.findByCategory("drink"));
		vo.setDesserts(itemService.findByCategory("dessert"));		
		vo.setServiceOrders(serviceOrderService.findAllByIsOpen());
		return returnListToUser(vo);
	}

	private ResponseEntity<OrderVO> returnListToUser(OrderVO vo) {
		return new ResponseEntity<OrderVO>(vo, HttpStatus.OK);
	}

}