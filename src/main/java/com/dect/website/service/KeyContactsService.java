package com.dect.website.service;

import com.dect.website.entity.primary.KeyContacts;
import com.dect.website.repository.primary.KeyContactsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KeyContactsService {

    @Autowired
    private KeyContactsRepository keyContactRepository;

    public void saveKeyContacts(KeyContacts keyContacts) {
        keyContactRepository.save(keyContacts);
    }

    public Iterable<KeyContacts> getAllKeyContacts() {
        return keyContactRepository.findAll();
    }

    public void deleteKeyContact(Long id){
         keyContactRepository.deleteById(id);
    }
}