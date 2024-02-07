package com.dect.website.repository.primary;

import com.dect.website.entity.primary.Roles;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Roles,Long> {
}
