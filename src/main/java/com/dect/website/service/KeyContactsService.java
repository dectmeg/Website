package com.dect.website.service;

import com.dect.website.dtos.KeyContactOrderDTO;
import com.dect.website.entity.primary.KeyContacts;
import com.dect.website.repository.primary.KeyContactsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

//    @Transactional
//    public void reorderKeyContacts(List<KeyContactOrderDTO> keyContactOrders) {
//        for (KeyContactOrderDTO keyContactOrder : keyContactOrders) {
//            KeyContacts contact = keyContactRepository.findById(keyContactOrder.getId()).orElseThrow(
//                    () -> new IllegalArgumentException("Invalid key contact ID: " + keyContactOrder.getId())
//            );
//            // Assuming there's an 'order' field in KeyContacts entity to store the order value
//            contact.setOrder(keyContactOrder.getOrder());
//            keyContactRepository.save(contact);
//        }
//    }
}