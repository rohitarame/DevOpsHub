package com.DevOpsHub.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/deployments")
public class DeploymentController {
    @GetMapping
    public ResponseEntity<Map<String, Object>> listDeployments() {
        return ResponseEntity.ok(Map.of(
            "deployments", java.util.List.of(
                Map.of("id", "dep-001", "name", "web-api", "status", "running"),
                Map.of("id", "dep-002", "name", "worker", "status", "healthy")
            )
        ));
    }

    @PostMapping
    public ResponseEntity<Map<String, String>> triggerDeployment() {
        return ResponseEntity.accepted().body(Map.of("message", "Deployment queued successfully"));
    }
}
