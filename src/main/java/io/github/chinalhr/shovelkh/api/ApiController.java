package io.github.chinalhr.shovelkh.api;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @Author: lihanrong
 * @Date: 2021/2/2 3:36 下午
 * @Description:
 */
@Controller
public class ApiController {

    @Value("${spring.application.name}")
    private String applicationName;

    private static final Logger logger = LoggerFactory.getLogger(ApiController.class);

    @GetMapping("/api/application.name")
    public ResponseEntity<String> getApplicationName() {
        logger.info("getApplicationName:{}", applicationName);
        return new ResponseEntity<>(applicationName, HttpStatus.OK);
    }

    @GetMapping("/ping")
    public ResponseEntity<String> ping() {
        return new ResponseEntity<>("ok", HttpStatus.OK);
    }
}
