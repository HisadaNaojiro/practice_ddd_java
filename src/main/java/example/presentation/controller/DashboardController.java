package example.presentation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ダッシュボード
 */
@Controller
@RequestMapping("/")
class DashboardController {

    @GetMapping
    String show() {
        return "dashboard";
    }
}