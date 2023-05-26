package com.codewitharjun.fullstackbackend.Config;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.DatabasePopulator;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

import javax.sql.DataSource;
@Configuration
public class DataInitializationConfig {

    @Autowired
    private DataSource dataSource;

    @Bean
    public InitializingBean initializeData() {
        return () -> {
            DatabasePopulator populator = new ResourceDatabasePopulator(new ClassPathResource("data.sql"));
            populator.populate(dataSource.getConnection());
        };
    }
}
