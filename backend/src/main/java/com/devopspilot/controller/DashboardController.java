package com.DevOpsHub.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/dashboard")
public class DashboardController {
    @GetMapping
    public ResponseEntity<Map<String, Object>> dashboard() {
        return ResponseEntity.ok(Map.of(
            "status", "ok",
            "message", "DevOpsHub dashboard ready",
            "deployments", 3,
            "containers", 7,
            "clusters", 2
        ));
    }
}
