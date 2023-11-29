package com.example.controller.admin;

import com.example.constant.SystemConstant;
import com.example.dto.OrderDTO;
import com.example.dto.ReportDTO;
import com.example.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "reportControllerOfAdmin")
public class ReportController {

    @Autowired
    private IOrderService orderService;

    @RequestMapping(value = "/admin/report/list", method = RequestMethod.GET)
    public ModelAndView getReport(@ModelAttribute("model") ReportDTO model) {
        ModelAndView mav = new ModelAndView("admin/report/list");
        List<OrderDTO> reports = orderService.report(model.getFromDate(), model.getToDate());
        int total = 0;
        for (OrderDTO item: reports) {
            if (!item.getStatus().equals(SystemConstant.CUSTOMER_CANCEL)) {
                total += item.getTotalPrice();
                mav.addObject("total", total);
            }
        }
        mav.addObject("reports", reports);
        mav.addObject("model", model);
        return mav;
    }
}
