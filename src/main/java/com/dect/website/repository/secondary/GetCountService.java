package com.dect.website.repository.secondary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class GetCountService {

    @Autowired
    private CountRepository countRepository;
    public Map<String, Object> getCounts() {
//        String sql = "SELECT (SELECT COUNT(*) FROM cand_det) AS countTable1, (SELECT COUNT(*) FROM skill_hand_table_per) AS countTable2";
        return countRepository.getCount();
    }
}
