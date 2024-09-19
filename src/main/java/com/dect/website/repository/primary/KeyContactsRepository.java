package com.dect.website.repository.primary;

import com.dect.website.entity.primary.KeyContacts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface KeyContactsRepository extends JpaRepository<KeyContacts, Long> {
	
	public Iterable<KeyContacts> findAllByOrderByOrderNumberAsc();
	
	@Query(value = "SELECT coalesce(max(orderNumber), 0) FROM KeyContacts")
    public Long getMaxOrderNumber();
}
