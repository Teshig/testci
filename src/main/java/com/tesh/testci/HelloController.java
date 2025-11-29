package com.tesh.testci;

import lombok.Builder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Builder
@RestController
public class HelloController {

  @GetMapping("/")
  public String hello() {
    return "Hello from Fly.io Spring Boot Demo!";
  }
}
