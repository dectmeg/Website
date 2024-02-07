package com.dect.website.repository.secondary;

import com.dect.website.entity.secondary.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Map;

public interface CountRepository extends JpaRepository<Student, Integer> {
    @Query(value = "SELECT (SELECT COUNT(*) FROM cand_det) AS connect_kam, (SELECT COUNT(*) FROM cand_det where sex = 'F') AS female_count, (SELECT COUNT(*) FROM cand_det where sex = 'M') AS male_count, (SELECT COUNT(*) FROM cand_det where sex = 'O') AS others_count, (SELECT COUNT(*) FROM skill_hand_table_per) AS skill_hands", nativeQuery = true)
    Map<String, Object> getCount();
}
