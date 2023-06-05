package com.cjt.migratex.service;

import org.flywaydb.core.Flyway;

public class FlywayMigrationService {
    public static void main(String[] args) {
        // Initialize Flyway
        Flyway flyway = Flyway.configure().dataSource("jdbc:mysql://localhost:3306/consultant", "root", "12345678").load();

        // Run migration
        flyway.migrate();
    }
}
